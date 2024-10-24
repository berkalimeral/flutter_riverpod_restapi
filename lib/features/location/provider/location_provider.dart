import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/providers/app_providers.dart';
import '../../../product/models/location/location_model.dart';

part 'location_provider.g.dart';

@riverpod
Future<LocationModel> locations(Ref ref) async {
  final rickMortyService = ref.watch(AppProviders.rickMortyServiceProvider);
  return rickMortyService.getLocations();
}

@riverpod
Future<List<LocationModel>> locationById(Ref ref, List<String> id) async {
  final rickMortyService = ref.watch(AppProviders.rickMortyServiceProvider);
  return rickMortyService.getLocationById(id);
}
