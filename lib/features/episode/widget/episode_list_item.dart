part of '../view/episode_view.dart';

class _EpisodeListItem extends StatelessWidget {
  const _EpisodeListItem({required this.episode});
  final Episode episode;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(episode.name ?? ''),
        subtitle: Text(episode.airDate ?? ''),
        trailing: Text(episode.episode ?? ''),
        leading: const Icon(Icons.movie),
      ),
    );
  }
}
