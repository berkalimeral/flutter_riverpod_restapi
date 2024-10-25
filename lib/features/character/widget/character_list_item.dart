part of '../view/character_view.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({
    super.key,
    required this.character,
    this.isLoading = false,
  });

  final Character character;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingAllDefault,
      child: ClipPath(
        clipper: CustomCardShape(),
        child: isLoading
            ? const ShimmerEffect()
            : GestureDetector(
                onTap: () {
                  context.push(RouteNames.characterDetailScreen,
                      extra: character);
                },
                child: Container(
                  width: context.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.teal[900]!,
                        Colors.teal[700]!,
                        Colors.teal[500]!,
                        Colors.teal[300]!,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    border: Border.all(color: Colors.cyanAccent, width: 2),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.blueGrey, // Sağ alt köşenin rengi
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              character.status ?? '',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                              ),
                              child: CustomImageBuild(image: character.image),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    character.name ?? '',
                                    style: context.textTheme.titleLarge,
                                  ),
                                  Text(character.species ?? ''),
                                ],
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
