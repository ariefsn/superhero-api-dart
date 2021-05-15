import 'package:superhero_api/models/url_model.dart';

class AlterEgoModel {
  final String url, name, classification, verse, realName, image;

  AlterEgoModel(
      {this.classification,
      this.image,
      this.name,
      this.realName,
      this.url,
      this.verse});

  AlterEgoModel.fromJson(Map<String, dynamic> json)
      : classification = json["classification"],
        image = json["image"],
        name = json["name"],
        realName = json["realName"],
        url = json["url"],
        verse = json["verse"];

  toJson() => {
        "classification": classification,
        "image": image,
        "name": name,
        "realName": realName,
        "url": url,
        "verse": verse,
      };
}

class OriginModel {
  final UrlModel creator, universe;
  final String fullName, placeOfBirth, firstAppearance, alignment;
  final List<AlterEgoModel> alterEgos;
  final List<String> aliases;

  OriginModel(
      {this.creator,
      this.universe,
      this.fullName,
      this.placeOfBirth,
      this.firstAppearance,
      this.alignment,
      this.alterEgos = const [],
      this.aliases = const []});

  OriginModel.fromJson(Map<String, dynamic> json)
      : creator = UrlModel.fromJson(json["creator"]),
        universe = UrlModel.fromJson(json["universe"]),
        fullName = json["fullName"],
        placeOfBirth = json["placeOfBirth"],
        firstAppearance = json["firstAppearance"],
        alignment = json["alignment"],
        alterEgos = ((json["alterEgos"] ?? []) as List)
            .map((e) => AlterEgoModel.fromJson(e))
            .toList(),
        aliases =
            ((json["aliases"] ?? []) as List).map((e) => e.toString()).toList();

  Map<String, dynamic> toJson() => {
        "creator": creator.toJson(),
        "universe": universe.toJson(),
        "fullName": fullName,
        "placeOfBirth": placeOfBirth,
        "firstAppearance": firstAppearance,
        "alignment": alignment,
        "alterEgos": alterEgos.map((e) => e.toJson()).toList(),
        "aliases": aliases,
      };
}

class OriginDataModel {
  final String id, name, url, type;

  OriginDataModel({
    this.id,
    this.name,
    this.url,
    this.type,
  });

  OriginDataModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        url = json["url"],
        type = json["type"];

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
        "type": type,
      };
}
