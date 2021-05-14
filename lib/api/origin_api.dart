import 'package:dio/dio.dart';
import 'package:superhero_api/api/base_api.dart';
import 'package:superhero_api/models/params_model.dart';
import 'package:superhero_api/models/query_model.dart';
import 'package:superhero_api/models/response_model.dart';

class OriginApi {
  Dio _api;

  OriginApi(BaseApi api) {
    _api = api.api;
  }

  /// Return list of origins
  Future<ResponseOriginsModel> getAll({
    ParamsModel params
  }) async {
    var p = params?.build();
    p = p != null && p != "" ? p : "";

    try {
      var res = await _api.get("/origins$p");

      return ResponseOriginsModel.fromJson(res.data);
    } catch (e) {
      return ResponseOriginsModel(false, e.toString());
    }
  }

  /// Return details of origin by id
  Future<ResponseOriginModel> getById(String id) async {
    try {
      var res = await _api.get("/origins/$id");

      return ResponseOriginModel.fromJson(res.data);
    } catch (e) {
      return ResponseOriginModel(false, e.toString());
    }
  }

  /// Return details of origin by query
  Future<ResponseOriginsModel> getByQuery(QueryModel query, {
    ParamsModel params
  }) async {
    var p = params?.build();
    p = p != null && p != "" ? p : "";

    try {
      var res = await _api.get("/origins/query/${query.field}/${query.opr.value()}/${query.value}$p");

      return ResponseOriginsModel.fromJson(res.data);
    } catch (e) {
      return ResponseOriginsModel(false, e.toString());
    }
  }
}