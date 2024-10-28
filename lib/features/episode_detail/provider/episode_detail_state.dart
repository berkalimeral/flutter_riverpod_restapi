import '../../../product/models/character/character_model.dart';

class EpisodeDetailState {
  List<Character> characters;
  bool isLoading;
  bool isError;
  EpisodeDetailState({
    required this.characters,
    this.isLoading = false,
    this.isError = false,
  });

  EpisodeDetailState copyWith({
    List<Character>? characters,
    bool? isLoading,
    bool? isError,
  }) {
    return EpisodeDetailState(
        characters: characters ?? this.characters,
        isLoading: isLoading ?? this.isLoading,
        isError: isError ?? this.isError);
  }
}
