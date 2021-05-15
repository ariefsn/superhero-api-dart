import 'package:superhero_api/models/url_model.dart';

class ConnectionModel {
  final List<UrlModel> teams;
  final List<String> occupations, bases, relatives;

  ConnectionModel({
    this.teams = const [],
    this.occupations = const [],
    this.bases = const [],
    this.relatives = const [],
  });

  ConnectionModel.fromJson(Map<String, dynamic> json)
      : teams = ((json["teams"] ?? []) as List)
            .map((e) => UrlModel.fromJson(e))
            .toList(),
        occupations = ((json["occupation"] ?? []) as List)
            .map((e) => e.toString())
            .toList(),
        bases =
            ((json["base"] ?? []) as List).map((e) => e.toString()).toList(),
        relatives = ((json["relatives"] ?? []) as List)
            .map((e) => e.toString())
            .toList();

  Map<String, dynamic> toJson() => {
        "teams": teams,
        "occupations": occupations,
        "bases": bases,
        "relatives": relatives,
      };
}
