import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/providers/app_providers.dart';
import 'episode_detail_state.dart';

part 'episode_detail_provider.g.dart';

@riverpod
class EpisodeDetail extends _$EpisodeDetail {
  @override
  EpisodeDetailState build() {
    return EpisodeDetailState(characters: []);
  }

  Future<void> fetchCharacters(List<String> episodeId) async {
    state = state.copyWith(isLoading: true);
    final rickMortyService = ref.watch(AppProviders.rickMortyServiceProvider);
    final characters = await rickMortyService.getCharacterById(episodeId);
    if (characters.results?.isNotEmpty ?? false) {
      state = state.copyWith(characters: characters.results, isLoading: false);
    } else {
      state = state.copyWith(isError: true, isLoading: false);
    }
  }
}
