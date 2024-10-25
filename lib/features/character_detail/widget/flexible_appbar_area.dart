part of '../view/character_detail_view.dart';

class _FlexibleAppBarArea extends StatelessWidget {
  const _FlexibleAppBarArea({
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Stack(
        children: [
          CustomImageBuild(
            image: character.image,
            width: context.width,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: context.dynamicHeight(0.04),
              width: context.width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
              ),
              child: Text(
                character.name ?? '',
                style: context.textTheme.titleLarge,
              ),
            ),
          )
        ],
      ),
    );
  }
}
