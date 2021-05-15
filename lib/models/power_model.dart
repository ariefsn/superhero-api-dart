class PowerDetailsModel {
  final String title, description;

  PowerDetailsModel({this.title, this.description});

  PowerDetailsModel.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        description = json["description"];

  Map<String, dynamic> toJson() => {"title": title, "description": description};
}

class PowerModel {
  final String summary;
  final List<PowerDetailsModel> details;

  PowerModel({this.summary, this.details = const []});

  PowerModel.fromJson(Map<String, dynamic> json)
      : summary = json["summary"],
        details = ((json["details"] ?? []) as List)
            .map((e) => PowerDetailsModel.fromJson(e))
            .toList();

  Map<String, dynamic> toJson() => {"summary": summary, "details": details};
}
