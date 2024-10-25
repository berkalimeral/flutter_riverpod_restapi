import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/providers/app_providers.dart';
import '../../../product/models/character/character_model.dart';

part 'character_provider.g.dart';

class CharactersState {
  final List<Character> characters;
  final List<Character> searchCharacters;
  final bool hasNextPage;
  final bool loadMore;
  final bool isLoading;
  final bool isSearch;
  final int currentPage;

  CharactersState(
      {required this.characters,
      required this.searchCharacters,
      this.hasNextPage = true,
      this.loadMore = false,
      this.isLoading = false,
      this.isSearch = false,
      required this.currentPage});

  CharactersState copyWith({
    List<Character>? characters,
    List<Character>? searchCharacters,
    bool? hasNextPage,
    bool? loadMore,
    bool? isLoading,
    bool? isSearch,
    int? currentPage,
  }) {
    return CharactersState(
      characters: characters ?? this.characters,
      searchCharacters: searchCharacters ?? this.searchCharacters,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      loadMore: loadMore ?? this.loadMore,
      isLoading: isLoading ?? this.isLoading,
      isSearch: isSearch ?? this.isSearch,
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
      searchCharacters: [],
      currentPage: _currentPage,
    );
  }

  Future<List<Character>> fetchCharacters() async {
    try {
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
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        state = state.copyWith(searchCharacters: []);
        return [];
      } else {
        state = state.copyWith(searchCharacters: []);
        return [];
      }
    }
  }

  Future<void> loadMore() async {
    if (!_hasNextPage) return;
    if (state.isSearch) {
      return;
    }
    state = state.copyWith(loadMore: true, isLoading: true);

    var characters = await fetchCharacters();
    state = state.copyWith(isLoading: false, characters: characters);
  }

  void refresh() async {
    _currentPage = 1;
    _characters.clear();
    _hasNextPage = true;
    state = state.copyWith(loadMore: true, isLoading: true, isSearch: false);
    var characters = await fetchCharacters();
    state = state.copyWith(isLoading: false, characters: characters);
  }

  Future<void> getCharacterByQuery(
      {Map<String, dynamic>? queryParameters}) async {
    final rickMortyService = ref.watch(AppProviders.rickMortyServiceProvider);
    if (queryParameters?.isEmpty ?? true) {
      state = state.copyWith(isSearch: false);
      return;
    }
    state = state.copyWith(isLoading: true);
    var character = await rickMortyService.getCharacterByQuery(
        queryParameters: queryParameters);
    if (character.results != null) {
      state =
          state.copyWith(isSearch: true, searchCharacters: character.results);
    } else {
      state = state.copyWith(isSearch: true, searchCharacters: []);
    }
    state = state.copyWith(isLoading: false);
  }
}

@riverpod
Future<List<CharacterModel>> characterById(Ref ref, List<String> id) async {
  final rickMortyService = ref.watch(AppProviders.rickMortyServiceProvider);
  return rickMortyService.getCharacterById(id);
}
