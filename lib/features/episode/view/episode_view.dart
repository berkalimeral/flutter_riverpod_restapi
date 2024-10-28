import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restapi/core/extensions/context_extension.dart';

import '../../../core/widgets/error/error_screen.dart';
import '../../../core/widgets/loading/loading_screen.dart';
import '../../../product/models/episode/episode_model.dart';
import '../provider/episode_provider.dart';

part '../widget/episode_list_item.dart';
part '../widget/episode_list.dart';

part 'episode_view_mixin.dart';

class EpisodeScreen extends ConsumerStatefulWidget {
  const EpisodeScreen({super.key});

  @override
  ConsumerState<EpisodeScreen> createState() => _EpisodeScreenState();
}

class _EpisodeScreenState extends ConsumerState<EpisodeScreen>
    with EpisodeViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bölümler'),
      ),
      body: RefreshIndicator(
        onRefresh: () async => ref.read(episodesProvider.notifier).refresh(),
        child: _EpisodeList(
          scrollController: scrollController,
        ),
      ),
    );
  }
}
