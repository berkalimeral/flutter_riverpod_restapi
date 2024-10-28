part of '../view/location_detail_view.dart';

class _LocationCharacterList extends StatelessWidget {
  const _LocationCharacterList({
    required this.locationDetail,
  });

  final LocationDetailState locationDetail;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: context.paddingAllDefault,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 2 / 3,
      ),
      itemCount: locationDetail.characters.length,
      itemBuilder: (context, index) {
        var character = locationDetail.characters[index];
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
