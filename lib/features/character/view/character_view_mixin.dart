part of 'character_view.dart';

mixin CharacterViewMixin on ConsumerState<CharacterScreen> {
  final ScrollController scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(_detectScrollBottom);
    Future.microtask(
        () => ref.read(charactersProvider.notifier).fetchCharacters());
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
      ref.read(charactersProvider.notifier).loadMore();
    }
  }
}
