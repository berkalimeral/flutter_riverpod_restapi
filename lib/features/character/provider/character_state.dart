import '../../../product/models/character/character_model.dart';

class CharactersState {
  final List<Character> characters;
  final List<Character> searchCharacters;
  final bool hasNextPage;
  final bool isLoading;
  final bool isSearch;
  final int currentPage;

  const CharactersState({
    required this.characters,
    required this.searchCharacters,
    this.hasNextPage = true,
    this.isLoading = false,
    this.isSearch = false,
    required this.currentPage,
  });

  CharactersState copyWith({
    List<Character>? characters,
    List<Character>? searchCharacters,
    bool? hasNextPage,
    bool? isLoading,
    bool? isSearch,
    int? currentPage,
  }) {
    return CharactersState(
      characters: characters ?? this.characters,
      searchCharacters: searchCharacters ?? this.searchCharacters,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      isLoading: isLoading ?? this.isLoading,
      isSearch: isSearch ?? this.isSearch,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
