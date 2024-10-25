part of 'character_detail_view.dart';

mixin CharacterDetailMixin on ConsumerState<CharacterDetailView> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref
        .read(characterDetailProvider.notifier)
        .fetchEpisodes(widget.character.episode ?? []));
  }
}
