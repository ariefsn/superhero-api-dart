class UrlModel {
  final String name, url;

  UrlModel({this.name, this.url});

  UrlModel.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        url = json["url"];

  Map<String, dynamic> toJson() => {"name": name, "url": url};
}
