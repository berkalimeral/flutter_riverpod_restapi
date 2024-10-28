import '../../../product/models/character/character_model.dart';

class LocationDetailState {
  List<Character> characters;
  bool isLoading;
  bool isError;
  LocationDetailState({
    required this.characters,
    this.isLoading = false,
    this.isError = false,
  });

  LocationDetailState copyWith({
    List<Character>? characters,
    bool? isLoading,
    bool? isError,
  }) {
    return LocationDetailState(
        characters: characters ?? this.characters,
        isLoading: isLoading ?? this.isLoading,
        isError: isError ?? this.isError);
  }
}
