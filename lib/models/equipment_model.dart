class EquipmentItemModel {
  final String title, description;

  EquipmentItemModel({this.title, this.description});

  EquipmentItemModel.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        description = json["description"];

  Map<String, dynamic> toJson() => {"title": title, "description": description};
}

class EquipmentDetailsModel {
  final String summary;
  final List<EquipmentItemModel> list;

  EquipmentDetailsModel({this.summary, this.list = const []});

  EquipmentDetailsModel.fromJson(Map<String, dynamic> json)
      : summary = json["summary"],
        list = ((json["list"] ?? []) as List)
            .map((e) => EquipmentItemModel.fromJson(e))
            .toList();

  Map<String, dynamic> toJson() => {"summary": summary, "list": list};
}

class ItemModel {
  final EquipmentDetailsModel equipment, weapon;

  ItemModel({this.equipment, this.weapon});

  ItemModel.fromJson(Map<String, dynamic> json)
      : equipment = EquipmentDetailsModel.fromJson(json["equipment"]),
        weapon = EquipmentDetailsModel.fromJson(json["weapon"]);

  Map<String, dynamic> toJson() =>
      {"equipment": equipment.toJson(), "weapon": weapon.toJson()};
}
