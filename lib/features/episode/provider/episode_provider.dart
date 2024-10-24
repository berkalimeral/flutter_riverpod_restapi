import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/providers/app_providers.dart';
import '../../../product/models/episode/episode_model.dart';

part 'episode_provider.g.dart';

@riverpod
Future<EpisodeModel> episodes(Ref ref) async {
  final rickMortyService = ref.watch(AppProviders.rickMortyServiceProvider);
  return rickMortyService.getEpisodes();
}

@riverpod
Future<List<EpisodeModel>> episodeById(Ref ref, List<String> id) async {
  final rickMortyService = ref.watch(AppProviders.rickMortyServiceProvider);
  return rickMortyService.getEpisodeById(id);
}
