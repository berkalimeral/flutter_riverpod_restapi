import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restapi/core/extensions/context_extension.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/image_build/custom_image_build.dart';
import '../../../product/models/character/character_model.dart';
import '../provider/character_detail_provider.dart';

part 'character_detail_mixin.dart';

part '../widget/character_episode_list.dart';
part '../widget/character_info_area.dart';
part '../widget/flexible_appbar_area.dart';

class CharacterDetailView extends ConsumerStatefulWidget {
  const CharacterDetailView({super.key, required this.character});

  final Character character;

  @override
  ConsumerState<CharacterDetailView> createState() =>
      _CharacterDetailViewState();
}

class _CharacterDetailViewState extends ConsumerState<CharacterDetailView>
    with CharacterDetailMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: context.dynamicHeight(0.35),
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          flexibleSpace: _FlexibleAppBarArea(character: widget.character),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: context.paddingAllDefault,
            child: Column(
              children: [
                _CharacterInfoArea(character: widget.character),
                SizedBox(
                  height: context.dynamicHeight(0.02),
                ),
                _CharacterEpisodeList(character: widget.character)
              ],
            ),
          ),
        )
      ],
    ));
  }
}
