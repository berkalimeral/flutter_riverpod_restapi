part of '../view/character_detail_view.dart';

class _CharacterEpisodeList extends StatelessWidget {
  const _CharacterEpisodeList({
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(context.dynamicWidth(0.02)),
      ),
      child: Padding(
        padding: context.paddingAllDefault,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Bölüm Listesi', style: context.textTheme.titleLarge),
            SizedBox(
              height: context.dynamicHeight(0.4),
              child: Consumer(builder: (context, ref, child) {
                final episodes = ref.watch(characterDetailProvider);
                return ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: episodes.episodes.results?.length,
                  itemBuilder: (context, index) {
                    var episode = episodes.episodes.results?[index];
                    return Card(
                      child: ListTile(
                        title: Text(episode?.name ?? ''),
                        subtitle: Text(episode?.airDate ?? ''),
                        trailing: Text(episode?.episode ?? ''),
                      ),
                    );
                  },
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
