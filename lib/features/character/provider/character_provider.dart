import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/providers/app_providers.dart';
import '../../../product/models/character/character_model.dart';

part 'character_provider.g.dart';

class CharactersState {
  final List<Character> characters;
  final bool hasNextPage;
  final bool loadMore;
  final bool isLoading;
  final int currentPage;

  CharactersState(
      {required this.characters,
      this.hasNextPage = true,
      this.loadMore = false,
      this.isLoading = false,
      required this.currentPage});

  CharactersState copyWith({
    List<Character>? characters,
    bool? hasNextPage,
    bool? loadMore,
    bool? isLoading,
    int? currentPage,
  }) {
    return CharactersState(
      characters: characters ?? this.characters,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      loadMore: loadMore ?? this.loadMore,
      isLoading: isLoading ?? this.isLoading,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}

@riverpod
class Characters extends _$Characters {
  int _currentPage = 1;
  final List<Character> _characters = [];
  bool _hasNextPage = true;

  @override
  CharactersState build() {
    return CharactersState(
      characters: [],
      currentPage: _currentPage,
    );
  }

  Future<List<Character>> fetchCharacters() async {
    if (!_hasNextPage) return _characters;
    state = state.copyWith(isLoading: true);
    final rickMortyService = ref.watch(AppProviders.rickMortyServiceProvider);
    final response = await rickMortyService
        .getCharacters(queryParameters: {'page': _currentPage.toString()});

    if (response.results != null) {
      _characters.addAll(response.results ?? []);
      _hasNextPage = response.info?.next != null;
      _currentPage++;
    }
    state = state.copyWith(
        characters: _characters, isLoading: false, currentPage: _currentPage);
    return _characters;
  }

  Future<void> loadMore() async {
    if (!_hasNextPage) return;
    state = state.copyWith(loadMore: true, isLoading: true);
    var characters = await fetchCharacters();
    state = state.copyWith(isLoading: false, characters: characters);
  }

  void refresh() async {
    _currentPage = 1;
    _characters.clear();
    _hasNextPage = true;
    state = state.copyWith(loadMore: true, isLoading: true);
    var characters = await fetchCharacters();
    state = state.copyWith(isLoading: false, characters: characters);
  }
}

@riverpod
Future<List<CharacterModel>> characterById(Ref ref, List<String> id) async {
  final rickMortyService = ref.watch(AppProviders.rickMortyServiceProvider);
  return rickMortyService.getCharacterById(id);
}
