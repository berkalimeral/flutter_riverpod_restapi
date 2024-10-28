import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restapi/core/extensions/context_extension.dart';
import 'package:flutter_riverpod_restapi/features/episode_detail/provider/episode_detail_state.dart';

import '../../../core/widgets/error/error_screen.dart';
import '../../../core/widgets/image_build/custom_image_build.dart';
import '../../../core/widgets/loading/loading_screen.dart';
import '../../../product/models/episode/episode_model.dart';
import '../provider/episode_detail_provider.dart';

part 'episode_detail_mixin.dart';
part '../widget/episode_character_list.dart';

class EpisodeDetailScreen extends ConsumerStatefulWidget {
  const EpisodeDetailScreen({super.key, required this.episode});

  final Episode episode;

  @override
  ConsumerState<EpisodeDetailScreen> createState() =>
      _EpisodeDetailScreenState();
}

class _EpisodeDetailScreenState extends ConsumerState<EpisodeDetailScreen>
    with EpisodeDetailMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.episode.name ?? '')),
      body: Padding(
        padding: context.paddingAllDefault,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.episode.episode} - ${widget.episode.name}',
              style: context.textTheme.titleLarge,
            ),
            Text(
              widget.episode.airDate ?? '',
              style: context.textTheme.titleLarge,
            ),
            Text('${widget.episode.characters?.length} karakter'),
            Expanded(
              child: Consumer(builder: (context, ref, child) {
                final episodeDetail = ref.watch(episodeDetailProvider);
                if (episodeDetail.isLoading) {
                  return const LoadingScreen();
                }
                if (episodeDetail.isError) {
                  return const ErrorScreen(
                    error: 'Karakter bulunumadı!',
                  );
                }
                return _EpisodeCharacterList(episodeDetail: episodeDetail);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
