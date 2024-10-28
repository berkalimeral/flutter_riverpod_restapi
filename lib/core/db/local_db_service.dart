import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'local_db_model.dart';

final class LocalDbService {
  static final LocalDbService _instance = LocalDbService._();
  static late final Isar? _isar;

  static LocalDbService get instance => _instance;

  LocalDbService._();

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [CharacterLocalSchema],
      directory: dir.path,
    );
  }

  Future<void> addCharacter(CharacterLocal character) async {
    await _isar?.writeTxn(() async {
      final existingCharacter = await _isar?.characterLocals
          .filter()
          .nameEqualTo(character.name ?? '')
          .findFirst();

      if (existingCharacter != null) {
        await _isar?.characterLocals.delete(existingCharacter.id);
      } else {
        await _isar?.characterLocals.put(character);
      }
    });
  }

  Future<List<CharacterLocal>?> getCharacters() async {
    var allCharacters = await _isar?.characterLocals.where().findAll();
    return allCharacters;
  }

  Future<void> deleteCharacter(String name) async {
    await _isar?.writeTxn(() async {
      final character =
          await _isar?.characterLocals.filter().nameEqualTo(name).findFirst();
      if (character != null) {
        await _isar?.characterLocals.delete(character.id);
      }
    });
  }

  Future<void> deleteAllCharacters() async {
    await _isar?.writeTxn(() async => await _isar?.characterLocals.clear());
  }

  Future<void> updateCharacter(CharacterLocal character) async {
    await _isar
        ?.writeTxn(() async => await _isar?.characterLocals.put(character));
  }
}
