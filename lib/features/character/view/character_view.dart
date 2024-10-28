import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restapi/core/extensions/context_extension.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../../../core/db/local_db_model.dart';
import '../../../core/routes/route_names.dart';
import '../../../core/utility/custom_clipper/custom_clipper.dart';
import '../../../core/widgets/image_build/custom_image_build.dart';
import '../../../core/widgets/loading/loading_screen.dart';
import '../../../core/widgets/shimmer_effect/shimmer_effect.dart';
import '../../../product/models/character/character_model.dart';
import '../../favorites/provider/favorite_provider.dart';
import '../provider/character_provider.dart';
import '../widget/custom_filter.dart';

part 'character_view_mixin.dart';
part '../widget/character_list_item.dart';
part '../widget/character_list.dart';
part '../widget/character_search.dart';

class CharacterScreen extends ConsumerStatefulWidget {
  const CharacterScreen({super.key});

  @override
  ConsumerState<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends ConsumerState<CharacterScreen>
    with CharacterViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick & Morty Karakterler'),
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: () async => ref.read(charactersProvider.notifier).refresh(),
        child: Padding(
          padding: context.paddingAllDefault,
          child: Column(
            children: [
              _CharacterSearch(searchController: searchController),
              _bodyTitle(context),
              Consumer(builder: (context, ref, child) {
                final characterState = ref.watch(charactersProvider);
                if (characterState.isSearch &&
                    characterState.searchCharacters.isEmpty) {
                  return const Align(
                    alignment: Alignment.center,
                    child: Text('Karakter bulunamadı!'),
                  );
                }
                return Expanded(
                    child: characterState.isLoading
                        ? const LoadingScreen()
                        : _CharacterList(scrollController: scrollController));
              }),
            ],
          ),
        ),
      ),
    );
  }

  Row _bodyTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Karakterler',
          style: context.textTheme.titleMedium,
        ),
        TextButton(
          onPressed: () async {
            ref.read(charactersProvider.notifier).refresh();
          },
          child: const Text(
            'Reset',
          ),
        )
      ],
    );
  }
}
