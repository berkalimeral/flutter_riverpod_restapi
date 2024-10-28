import 'package:isar/isar.dart';

part 'local_db_model.g.dart';

@collection
class CharacterLocal {
  Id id = Isar.autoIncrement;

  int? characterId;

  bool isFavorite = false;

  String? name;

  String? status;

  String? species;

  String? type;

  String? gender;

  String? image;

  List<String>? episode;
}
