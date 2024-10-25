part of '../view/character_view.dart';

class _CharacterList extends StatelessWidget {
  const _CharacterList({
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final characterState = ref.watch(charactersProvider);

        return ListView.builder(
          controller: scrollController,
          itemCount: characterState.isSearch
              ? characterState.searchCharacters.length
              : characterState.characters.length,
          itemBuilder: (context, index) {
            Character character;

            if (characterState.isSearch) {
              character = characterState.searchCharacters[index];
            } else {
              character = characterState.characters[index];
            }

            return Column(
              children: [
                CharacterItem(
                    character: character, isLoading: characterState.isLoading),
                if (characterState.loadMore &&
                    index == characterState.characters.length - 1)
                  const CircularProgressIndicator.adaptive()
              ],
            );
          },
        );
      },
    );
  }
}
