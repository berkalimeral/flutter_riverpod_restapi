import '../../../product/models/info/info_model.dart';

abstract class BaseModel<T> {
  Info? info;
  List<T>? results;

  BaseModel({this.info, this.results});

  BaseModel.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? Info.fromJson(json['info']) : null;
    if (json['results'] != null) {
      results = <T>[];
      json['results'].forEach((v) {
        results!.add(parseResult(v));
      });
    }
  }

  T parseResult(Map<String, dynamic> json);
}
