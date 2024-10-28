import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/providers/app_providers.dart';
import '../../../product/models/location/location_model.dart';
import 'location_state.dart';

part 'location_provider.g.dart';

@riverpod
class Locations extends _$Locations {
  int _currentPage = 1;
  final List<Location> _locations = [];
  bool _hasNextPage = true;
  @override
  LocationState build() {
    return LocationState(location: [], currentPage: _currentPage);
  }

  Future<void> fetchEpisodes() async {
    if (!_hasNextPage) return;
    state = state.copyWith(isLoading: true);
    try {
      final rickMortyService = ref.watch(AppProviders.rickMortyServiceProvider);
      final location = await rickMortyService
          .getLocations(queryParameters: {'page': _currentPage.toString()});
      if (location.results != null) {
        _locations.addAll(location.results!);
        _hasNextPage = location.info?.next != null;
        _currentPage++;
      }
      state = state.copyWith(
          location: _locations,
          isLoading: false,
          currentPage: _currentPage,
          hasNextPage: _hasNextPage);
    } on DioException catch (_) {
      state = state.copyWith(isError: true, isLoading: false, location: []);
    }
  }

  Future<void> loadMore() async {
    if (!_hasNextPage || state.isSearch || state.isLoading) return;
    await fetchEpisodes();
  }

  Future<void> refresh() async {
    _currentPage = 1;
    _locations.clear();
    _hasNextPage = true;
    state = state.copyWith(isSearch: false);
    await fetchEpisodes();
  }
}
