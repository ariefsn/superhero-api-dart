import 'package:dio/dio.dart';
import 'package:superhero_api/api/base_api.dart';
import 'package:superhero_api/models/params_model.dart';
import 'package:superhero_api/models/query_model.dart';
import 'package:superhero_api/models/response_model.dart';

class AppearanceApi {
  Dio _api;

  AppearanceApi(BaseApi api) {
    _api = api.api;
  }

  /// Return list of appearances
  Future<ResponseAppearancesModel> getAll({
    ParamsModel params
  }) async {
    var p = params?.build();
    p = p != null && p != "" ? p : "";

    try {
      var res = await _api.get("/appearances$p");

      return ResponseAppearancesModel.fromJson(res.data);
    } catch (e) {
      return ResponseAppearancesModel(false, e.toString());
    }
  }

  /// Return details of appearance by id
  Future<ResponseAppearanceModel> getById(String id) async {
    try {
      var res = await _api.get("/appearances/$id");

      return ResponseAppearanceModel.fromJson(res.data);
    } catch (e) {
      return ResponseAppearanceModel(false, e.toString());
    }
  }

  /// Return details of appearance by query
  Future<ResponseAppearancesModel> getByQuery(QueryModel query, {
    ParamsModel params
  }) async {
    var p = params?.build();
    p = p != null && p != "" ? p : "";

    try {
      var res = await _api.get("/appearances/query/${query.field}/${query.opr.value()}/${query.value}$p");

      return ResponseAppearancesModel.fromJson(res.data);
    } catch (e) {
      return ResponseAppearancesModel(false, e.toString());
    }
  }
}