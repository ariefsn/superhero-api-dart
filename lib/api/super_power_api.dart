import 'package:dio/dio.dart';
import 'package:superhero_api/api/base_api.dart';
import 'package:superhero_api/models/params_model.dart';
import 'package:superhero_api/models/query_model.dart';
import 'package:superhero_api/models/response_model.dart';

class SuperPowerApi {
  Dio _api;

  SuperPowerApi(BaseApi api) {
    _api = api.api;
  }

  /// Return list of superPowers
  Future<ResponseSuperPowersModel> getAll({ParamsModel params}) async {
    var p = params?.build();
    p = p != null && p != "" ? p : "";

    try {
      var res = await _api.get("/superpowers$p");

      return ResponseSuperPowersModel.fromJson(res.data);
    } catch (e) {
      return ResponseSuperPowersModel(false, e.toString());
    }
  }

  /// Return details of superPower by id
  Future<ResponseSuperPowerModel> getById(String id) async {
    try {
      var res = await _api.get("/superpowers/$id");

      return ResponseSuperPowerModel.fromJson(res.data);
    } catch (e) {
      return ResponseSuperPowerModel(false, e.toString());
    }
  }

  /// Return details of superPower by query
  Future<ResponseSuperPowersModel> getByQuery(QueryModel query,
      {ParamsModel params}) async {
    var p = params?.build();
    p = p != null && p != "" ? p : "";

    try {
      var res = await _api.get(
          "/superpowers/query/${query.field}/${query.opr.value()}/${query.value}$p");

      return ResponseSuperPowersModel.fromJson(res.data);
    } catch (e) {
      return ResponseSuperPowersModel(false, e.toString());
    }
  }
}
