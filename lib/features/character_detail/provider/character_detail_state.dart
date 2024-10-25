import '../../../product/models/episode/episode_model.dart';

class CharacterDetailState {
  final EpisodeModel episodes;
  final bool hasNextPage;
  final bool isLoading;
  final int currentPage;

  const CharacterDetailState({
    required this.episodes,
    this.hasNextPage = true,
    this.isLoading = false,
    required this.currentPage,
  });

  CharacterDetailState copyWith({
    EpisodeModel? episodes,
    bool? hasNextPage,
    bool? isLoading,
    int? currentPage,
  }) {
    return CharacterDetailState(
      episodes: episodes ?? this.episodes,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      isLoading: isLoading ?? this.isLoading,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
