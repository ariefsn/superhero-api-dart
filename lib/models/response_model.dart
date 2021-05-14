import 'package:superhero_api/models/appearance_model.dart';
import 'package:superhero_api/models/origin_model.dart';
import 'package:superhero_api/models/super_power_model.dart';
import 'package:superhero_api/models/superhero_model.dart';

class ResponseModel {
  final bool isSuccess;
  final String message;

  ResponseModel(
    this.isSuccess,
    this.message
  );

  ResponseModel.fromJson(Map<String, dynamic> json)
    : isSuccess = json["success"],
      message = json["message"] ?? "";

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "message": message
  };
}

class ResponseListModel extends ResponseModel {
  final int count, total;

  ResponseListModel(
    bool isSuccess,
    String message,
    this.count, this.total
  ) : super(isSuccess, message);
}

// Heroes
class ResponseSuperheroesModel extends ResponseListModel {
  final List<SuperheroModel> data;

  ResponseSuperheroesModel(bool isSuccess, String message, {
    this.data,
    int count, int total
  }) : super(isSuccess, message, count, total);

  ResponseSuperheroesModel.fromJson(Map<String, dynamic> json)
    : data = ((json["data"]["list"] ?? []) as List).map((e) => SuperheroModel.fromJson(e)).toList(),
      super(json["success"], json["message"], json["data"]["count"] ?? 0, json["data"]["total"] ?? 0);
}

class ResponseSuperheroModel extends ResponseModel {
  final SuperheroModel data;

  ResponseSuperheroModel(bool isSuccess, String message, {
    this.data
  }) : super(isSuccess, message);

  ResponseSuperheroModel.fromJson(Map<String, dynamic> json)
    : data = SuperheroModel.fromJson(json["data"]),
      super(json["success"] ?? 0, json["message"] ?? 0);
}

// Appearance
class ResponseAppearancesModel extends ResponseListModel {
  final List<AppearanceDataModel> data;

  ResponseAppearancesModel(bool isSuccess, String message, {
    this.data,
    int count, int total
  }) : super(isSuccess, message, count, total);

  ResponseAppearancesModel.fromJson(Map<String, dynamic> json)
    : data = ((json["data"]["list"] ?? []) as List).map((e) => AppearanceDataModel.fromJson(e)).toList(),
      super(json["success"], json["message"], json["data"]["count"] ?? 0, json["data"]["total"] ?? 0);
}

class ResponseAppearanceModel extends ResponseModel {
  final AppearanceDataModel data;

  ResponseAppearanceModel(bool isSuccess, String message, {
    this.data
  }) : super(isSuccess, message);

  ResponseAppearanceModel.fromJson(Map<String, dynamic> json)
    : data = AppearanceDataModel.fromJson(json["data"]),
      super(json["success"] ?? 0, json["message"] ?? 0);
}

// Origin
class ResponseOriginsModel extends ResponseListModel {
  final List<OriginDataModel> data;

  ResponseOriginsModel(bool isSuccess, String message, {
    this.data,
    int count, int total
  }) : super(isSuccess, message, count, total);

  ResponseOriginsModel.fromJson(Map<String, dynamic> json)
    : data = ((json["data"]["list"] ?? []) as List).map((e) => OriginDataModel.fromJson(e)).toList(),
      super(json["success"], json["message"], json["data"]["count"] ?? 0, json["data"]["total"] ?? 0);
}

class ResponseOriginModel extends ResponseModel {
  final OriginDataModel data;

  ResponseOriginModel(bool isSuccess, String message, {
    this.data
  }) : super(isSuccess, message);

  ResponseOriginModel.fromJson(Map<String, dynamic> json)
    : data = OriginDataModel.fromJson(json["data"]),
      super(json["success"] ?? 0, json["message"] ?? 0);
}

// SuperPower
class ResponseSuperPowersModel extends ResponseListModel {
  final List<SuperPowerModel> data;

  ResponseSuperPowersModel(bool isSuccess, String message, {
    this.data,
    int count, int total
  }) : super(isSuccess, message, count, total);

  ResponseSuperPowersModel.fromJson(Map<String, dynamic> json)
    : data = ((json["data"]["list"] ?? []) as List).map((e) => SuperPowerModel.fromJson(e)).toList(),
      super(json["success"], json["message"], json["data"]["count"] ?? 0, json["data"]["total"] ?? 0);
}

class ResponseSuperPowerModel extends ResponseModel {
  final SuperPowerModel data;

  ResponseSuperPowerModel(bool isSuccess, String message, {
    this.data
  }) : super(isSuccess, message);

  ResponseSuperPowerModel.fromJson(Map<String, dynamic> json)
    : data = SuperPowerModel.fromJson(json["data"]),
      super(json["success"] ?? 0, json["message"] ?? 0);
}