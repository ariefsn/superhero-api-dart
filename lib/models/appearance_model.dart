import 'package:superhero_api/models/url_model.dart';

class AppearanceModel {
  final String gender, height, weight, eyeColor, hairColor;
  final List<UrlModel> types;

  AppearanceModel({
    this.gender,
    this.height,
    this.weight,
    this.hairColor,
    this.eyeColor,
    this.types
  });

  AppearanceModel.fromJson(Map<String, dynamic> json)
    : gender = json["gender"],
      height = json["height"],
      weight = json["weight"],
      hairColor = json["hairColor"],
      eyeColor = json["eyeColor"],
      types = ((json["types"] ?? []) as List).map((e) => UrlModel.fromJson(e)).toList();

  Map<String, dynamic> toJson() => {
    "gender":gender,
    "height": height,
    "weight": weight,
    "hairColor": hairColor,
    "eyeColor": eyeColor,
    "types": types.map((e) => e.toJson()).toList(),
  };
}

class AppearanceDataModel {
  final String id, name, url, type;

  AppearanceDataModel({
    this.id,
    this.name,
    this.url,
    this.type,
  });

  AppearanceDataModel.fromJson(Map<String, dynamic> json)
    : id = json["id"],
      name = json["name"],
      url = json["url"],
      type = json["type"];

  Map<String, dynamic> toJson() => {
    "id":id,
    "name": name,
    "url": url,
    "type": type,
  };
}
