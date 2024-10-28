part of 'favorite_view.dart';

mixin FavoriteViewMixin on ConsumerState<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await ref.read(favoriteProvider.notifier).getCharacters();
    });
  }
}
