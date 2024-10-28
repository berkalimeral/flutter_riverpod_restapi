import '../../../product/models/episode/episode_model.dart';

class EpisodeState {
  final List<Episode> episode;
  bool isLoading;
  bool isError;
  final bool hasNextPage;
  final bool isSearch;
  final int currentPage;

  EpisodeState({
    required this.episode,
    this.isLoading = false,
    this.isError = false,
    this.hasNextPage = true,
    this.isSearch = false,
    required this.currentPage,
  });

  EpisodeState copyWith({
    List<Episode>? episode,
    bool? isLoading,
    bool? isError,
    bool? hasNextPage,
    bool? isSearch,
    int? currentPage,
  }) {
    return EpisodeState(
      episode: episode ?? this.episode,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      isSearch: isSearch ?? this.isSearch,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
