import 'package:dio/dio.dart';
import 'package:flutter_riverpod_restapi/features/episode/provider/episode_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/providers/app_providers.dart';
import '../../../product/models/episode/episode_model.dart';

part 'episode_provider.g.dart';

@riverpod
class Episodes extends _$Episodes {
  int _currentPage = 1;
  final List<Episode> _episodes = [];
  bool _hasNextPage = true;
  @override
  EpisodeState build() {
    return EpisodeState(episode: [], currentPage: _currentPage);
  }

  Future<void> fetchEpisodes() async {
    if (!_hasNextPage) return;
    state = state.copyWith(isLoading: true);
    try {
      final rickMortyService = ref.watch(AppProviders.rickMortyServiceProvider);
      final episodes = await rickMortyService
          .getEpisodes(queryParameters: {'page': _currentPage.toString()});
      if (episodes.results != null) {
        _episodes.addAll(episodes.results!);
        _hasNextPage = episodes.info?.next != null;
        _currentPage++;
      }
      state = state.copyWith(
          episode: _episodes,
          isLoading: false,
          currentPage: _currentPage,
          hasNextPage: _hasNextPage);
    } on DioException catch (_) {
      state = state.copyWith(isError: true, isLoading: false, episode: []);
    }
  }

  Future<void> loadMore() async {
    if (!_hasNextPage || state.isSearch || state.isLoading) return;
    await fetchEpisodes();
  }

  Future<void> refresh() async {
    _currentPage = 1;
    _episodes.clear();
    _hasNextPage = true;
    state = state.copyWith(isSearch: false);
    await fetchEpisodes();
  }
}
