part of 'episode_view.dart';

mixin EpisodeViewMixin on ConsumerState<EpisodeScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_detectScrollBottom);
    Future.microtask(() => ref.read(episodesProvider.notifier).fetchEpisodes());
  }

  @override
  void dispose() {
    scrollController.removeListener(_detectScrollBottom);
    scrollController.dispose();
    super.dispose();
  }

  void _detectScrollBottom() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentPosition = scrollController.position.pixels;
    const int delta = 200;

    if (maxScroll - currentPosition <= delta) {
      ref.read(episodesProvider.notifier).loadMore();
    }
  }
}
