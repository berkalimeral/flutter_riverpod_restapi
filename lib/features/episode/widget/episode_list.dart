part of '../view/episode_view.dart';

class _EpisodeList extends ConsumerWidget {
  const _EpisodeList({required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final episodeState = ref.watch(episodesProvider);

    return Padding(
      padding: context.paddingAllDefault,
      child: episodeState.isLoading
          ? const LoadingScreen()
          : episodeState.isError
              ? const ErrorScreen(error: 'Bölümler yüklenemedi!')
              : ListView.builder(
                  controller: scrollController,
                  itemCount: episodeState.episode.length,
                  itemBuilder: (context, index) {
                    final episode = episodeState.episode[index];
                    return _EpisodeListItem(episode: episode);
                  },
                ),
    );
  }
}
