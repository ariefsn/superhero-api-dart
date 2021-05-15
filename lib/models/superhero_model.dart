import 'package:superhero_api/models/appearance_model.dart';
import 'package:superhero_api/models/connection_model.dart';
import 'package:superhero_api/models/equipment_model.dart';
import 'package:superhero_api/models/gallery_model.dart';
import 'package:superhero_api/models/origin_model.dart';
import 'package:superhero_api/models/power_model.dart';
import 'package:superhero_api/models/power_stats_model.dart';
import 'package:superhero_api/models/url_model.dart';

class SuperheroModel {
  final String id, path, name, realName, portrait, history;
  final PowerStatsModel powerStats;
  final List<UrlModel> superPowers;
  final OriginModel origin;
  final AppearanceModel appearance;
  final ConnectionModel connection;
  final PowerModel power;
  final ItemModel item;
  final List<GalleryModel> gallery;

  SuperheroModel(
      {this.id,
      this.path,
      this.realName,
      this.name,
      this.portrait,
      this.history,
      this.powerStats,
      this.superPowers = const [],
      this.origin,
      this.appearance,
      this.connection,
      this.power,
      this.item,
      this.gallery = const []});

  SuperheroModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        path = json["path"],
        name = json["name"],
        realName = json["realName"],
        portrait = json["portrait"],
        history = json["history"],
        powerStats = PowerStatsModel.fromJson(json["powerStats"]),
        superPowers = ((json["superPower"] ?? []) as List)
            .map((e) => UrlModel.fromJson(e))
            .toList(),
        origin = OriginModel.fromJson(json["origin"]),
        appearance = AppearanceModel.fromJson(json["appearance"]),
        connection = ConnectionModel.fromJson(json["connections"]),
        power = PowerModel.fromJson(json["powers"]),
        item = ItemModel.fromJson(json["item"]),
        gallery = ((json["gallery"] ?? []) as List)
            .map((e) => GalleryModel.fromJson(e))
            .toList();

  Map<String, dynamic> toJson() => {
        "id": id,
        "path": path,
        "name": name,
        "realName": realName,
        "portrait": portrait,
        "history": history,
        "powerStats": powerStats.toJson(),
        "superPowers": superPowers.map((e) => e.toJson()).toList(),
        "origin": origin.toJson(),
        "appearance": appearance.toJson(),
        "connection": connection.toJson(),
        "power": power.toJson(),
        "item": item.toJson(),
        "gallery": gallery.map((e) => e.toJson()).toList(),
      };
}
