part of 'episode_detail_view.dart';

mixin EpisodeDetailMixin on ConsumerState<EpisodeDetailScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref
        .read(episodeDetailProvider.notifier)
        .fetchCharacters(widget.episode.characters!));
  }
}
