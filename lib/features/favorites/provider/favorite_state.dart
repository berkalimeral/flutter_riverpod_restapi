import '../../../core/db/local_db_model.dart';

class FavoriteState {
  final List<CharacterLocal> characters;
  bool isLoading;
  bool isFavorite;

  FavoriteState({
    required this.characters,
    this.isLoading = false,
    this.isFavorite = false,
  });

  FavoriteState copyWith({
    List<CharacterLocal>? characters,
    bool? isLoading,
    bool? isFavorite,
  }) {
    return FavoriteState(
        characters: characters ?? this.characters,
        isLoading: isLoading ?? this.isLoading,
        isFavorite: isFavorite ?? this.isFavorite);
  }
}
