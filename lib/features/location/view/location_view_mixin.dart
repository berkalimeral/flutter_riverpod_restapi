part of 'location_view.dart';

mixin LocationViewMixin on ConsumerState<LocationScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_detectScrollBottom);
    Future.microtask(
        () => ref.read(locationsProvider.notifier).fetchEpisodes());
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
      ref.read(locationsProvider.notifier).loadMore();
    }
  }
}
