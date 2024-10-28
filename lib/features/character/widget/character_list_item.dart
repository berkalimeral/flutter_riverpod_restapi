part of '../view/character_view.dart';

class CharacterItem extends ConsumerStatefulWidget {
  const CharacterItem({
    super.key,
    required this.character,
    this.isLoading = false,
  });

  final Character character;
  final bool isLoading;

  @override
  ConsumerState<CharacterItem> createState() => _CharacterItemState();
}

class _CharacterItemState extends ConsumerState<CharacterItem> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref
          .read(favoriteProvider.notifier)
          .checkIsFavorite(widget.character.name ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingAllDefault,
      child: ClipPath(
        clipper: CustomCardShape(),
        child: widget.isLoading
            ? const ShimmerEffect()
            : GestureDetector(
                onTap: () {
                  context.push(RouteNames.characterDetailScreen,
                      extra: widget.character);
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
                        top: 0,
                        right: 0,
                        child: Consumer(builder: (context, ref, child) {
                          final favoriteState = ref.watch(favoriteProvider);
                          final isFavorite = favoriteState.characters.any(
                              (char) =>
                                  char.characterId == widget.character.id);

                          return IconButton(
                            onPressed: () {
                              if (isFavorite) {
                                ref
                                    .read(favoriteProvider.notifier)
                                    .deleteCharacter(
                                        widget.character.name ?? '');
                              } else {
                                final characterLocal = CharacterLocal()
                                  ..characterId = widget.character.id
                                  ..name = widget.character.name
                                  ..image = widget.character.image
                                  ..status = widget.character.status
                                  ..species = widget.character.species
                                  ..type = widget.character.type
                                  ..gender = widget.character.gender
                                  ..episode = widget.character.episode;

                                ref
                                    .read(favoriteProvider.notifier)
                                    .toggleFavorite(characterLocal);
                              }
                            },
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isFavorite ? Colors.red : Colors.white,
                            ),
                          );
                        }),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.blueGrey, // Sağ alt köşenin rengi
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.character.status ?? '',
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
                              child: CustomImageBuild(
                                  image: widget.character.image),
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
                                    widget.character.name ?? '',
                                    style: context.textTheme.titleLarge,
                                  ),
                                  Text(widget.character.species ?? ''),
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
