import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/providers/app_providers.dart';
import '../../../product/models/character/character_model.dart';
import '../../../product/service/rick_morty_service.dart';
import 'character_state.dart';

part 'character_provider.g.dart';

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

  RickMortyService get _rickMortyService =>
      ref.read(AppProviders.rickMortyServiceProvider);

  Future<void> fetchCharacters() async {
    if (!_hasNextPage) return;

    state = state.copyWith(isLoading: true);

    try {
      final response = await _rickMortyService
          .getCharacters(queryParameters: {'page': _currentPage.toString()});

      if (response.results != null) {
        _characters.addAll(response.results!);
        _hasNextPage = response.info?.next != null;
        _currentPage++;
      }

      state = state.copyWith(
        characters: List.from(_characters),
        isLoading: false,
        currentPage: _currentPage,
        hasNextPage: _hasNextPage,
      );
    } on DioException catch (_) {
      state = state.copyWith(
        isLoading: false,
        searchCharacters: [],
      );
      // Consider logging the error or notifying the user
    }
  }

  Future<void> loadMore() async {
    if (!_hasNextPage || state.isSearch || state.isLoading) return;
    await fetchCharacters();
  }

  Future<void> refresh() async {
    _currentPage = 1;
    _characters.clear();
    _hasNextPage = true;
    state = state.copyWith(isSearch: false);
    await fetchCharacters();
  }

  Future<void> getCharacterByQuery(
      {Map<String, dynamic>? queryParameters}) async {
    if (queryParameters?.isEmpty ?? true) {
      state = state.copyWith(isSearch: false);
      return;
    }

    state = state.copyWith(isLoading: true);

    try {
      final character = await _rickMortyService.getCharacterByQuery(
        queryParameters: queryParameters,
      );

      state = state.copyWith(
        isSearch: true,
        searchCharacters: character.results ?? [],
        isLoading: false,
      );
    } on DioException catch (_) {
      state = state.copyWith(
        isSearch: true,
        searchCharacters: [],
        isLoading: false,
      );
      // Consider logging the error or notifying the user
    }
  }
}

@riverpod
Future<List<CharacterModel>> characterById(Ref ref, List<String> id) async {
  final rickMortyService = ref.watch(AppProviders.rickMortyServiceProvider);
  return rickMortyService.getCharacterById(id);
}
