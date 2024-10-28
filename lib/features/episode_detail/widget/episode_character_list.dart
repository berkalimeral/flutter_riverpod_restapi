part of '../view/episode_detail_view.dart';

class _EpisodeCharacterList extends StatelessWidget {
  const _EpisodeCharacterList({
    required this.episodeDetail,
  });

  final EpisodeDetailState episodeDetail;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: context.paddingAllDefault,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 2 / 3,
      ),
      itemCount: episodeDetail.characters.length,
      itemBuilder: (context, index) {
        var character = episodeDetail.characters[index];
        return Card(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomImageBuild(
              image: character.image,
            ),
            Text(character.name ?? ''),
            Text(character.status ?? ''),
          ],
        ));
      },
    );
  }
}
