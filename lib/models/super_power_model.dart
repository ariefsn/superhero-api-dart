class SuperPowerModel {
  final String id, name, url;

  SuperPowerModel({
    this.id,
    this.name,
    this.url,
  });

  SuperPowerModel.fromJson(Map<String, dynamic> json)
    : id = json["id"],
      name = json["name"],
      url = json["url"];

  Map<String, dynamic> toJson() => {
    "id":id,
    "name": name,
    "url": url,
  };
}
