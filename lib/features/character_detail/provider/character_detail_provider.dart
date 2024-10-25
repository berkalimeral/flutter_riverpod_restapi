import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/providers/app_providers.dart';
import '../../../product/models/episode/episode_model.dart';
import 'character_detail_state.dart';

part 'character_detail_provider.g.dart';

@riverpod
class CharacterDetail extends _$CharacterDetail {
  @override
  CharacterDetailState build() {
    return CharacterDetailState(episodes: EpisodeModel(), currentPage: 1);
  }

  Future<void> fetchEpisodes(List<String> ids) async {
    state = state.copyWith(isLoading: true);
    final episodes = await ref
        .watch(AppProviders.rickMortyServiceProvider)
        .getEpisodeById(ids);
    state = state.copyWith(episodes: episodes, isLoading: false);
  }
}
