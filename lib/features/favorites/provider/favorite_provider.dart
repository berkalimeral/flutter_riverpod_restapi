import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/db/local_db_model.dart';
import '../../../core/providers/app_providers.dart';
import 'favorite_state.dart';

part 'favorite_provider.g.dart';

@riverpod
class Favorite extends _$Favorite {
  @override
  FavoriteState build() {
    getCharacters();
    return FavoriteState(characters: []);
  }

  // Verilen karakterin favori olup olmadığını kontrol eder
  Future<bool> checkIsFavorite(String name) async {
    final characters =
        await ref.read(AppProviders.localDbServiceProvider).getCharacters();
    final isFavorite =
        characters?.any((element) => element.name == name) ?? false;
    state = state.copyWith(isFavorite: isFavorite);
    return isFavorite;
  }

  // Tüm favori karakterleri getirir
  Future<void> getCharacters() async {
    state = state.copyWith(isLoading: true);
    final characters =
        await ref.read(AppProviders.localDbServiceProvider).getCharacters();
    state = state.copyWith(
      characters: characters ?? [],
      isLoading: false,
    );
  }

  // Karakteri favorilerden siler
  Future<void> deleteCharacter(String name) async {
    await ref.read(AppProviders.localDbServiceProvider).deleteCharacter(name);
    state = state.copyWith(isFavorite: false);
    await getCharacters();
  }

  // Tüm favori karakterleri siler
  Future<void> deleteAllCharacters() async {
    await ref.read(AppProviders.localDbServiceProvider).deleteAllCharacters();
    state = state.copyWith(isFavorite: false);
    await getCharacters();
  }

  // Karakter bilgilerini günceller
  Future<void> updateCharacter(CharacterLocal character) async {
    await ref
        .read(AppProviders.localDbServiceProvider)
        .updateCharacter(character);
    await getCharacters();
  }

  // Yeni karakter ekler veya var olan karakteri siler
  Future<void> toggleFavorite(CharacterLocal character) async {
    final isFavorite = await checkIsFavorite(character.name ?? '');

    if (isFavorite) {
      await ref
          .read(AppProviders.localDbServiceProvider)
          .deleteCharacter(character.name ?? '');
      state = state.copyWith(isFavorite: false);
    } else {
      await ref
          .read(AppProviders.localDbServiceProvider)
          .addCharacter(character);
      state = state.copyWith(isFavorite: true);
    }

    await getCharacters();
  }
}
