import 'package:dio/dio.dart';
import 'package:superhero_api/api/base_api.dart';
import 'package:superhero_api/models/params_model.dart';
import 'package:superhero_api/models/query_model.dart';
import 'package:superhero_api/models/response_model.dart';

class HeroApi {
  Dio _api;

  HeroApi(BaseApi api) {
    _api = api.api;
  }

  /// Return list of superheroes
  Future<ResponseSuperheroesModel> getAll({ParamsModel params}) async {
    var p = params?.build();
    p = p != null && p != "" ? p : "";

    try {
      var res = await _api.get("/heroes$p");

      return ResponseSuperheroesModel.fromJson(res.data);
    } catch (e) {
      return ResponseSuperheroesModel(false, e.toString());
    }
  }

  /// Return details of hero by id
  Future<ResponseSuperheroModel> getById(String id) async {
    try {
      var res = await _api.get("/heroes/$id");

      return ResponseSuperheroModel.fromJson(res.data);
    } catch (e) {
      return ResponseSuperheroModel(false, e.toString());
    }
  }

  /// Return details of hero by path
  Future<ResponseSuperheroModel> getByPath(String path) async {
    path = path.substring(1, path.length - 1);

    try {
      var res = await _api.get("/heroes/$path");

      return ResponseSuperheroModel.fromJson(res.data);
    } catch (e) {
      return ResponseSuperheroModel(false, e.toString());
    }
  }

  /// Return details of hero by query
  Future<ResponseSuperheroesModel> getByQuery(QueryModel query,
      {ParamsModel params}) async {
    var p = params?.build();
    p = p != null && p != "" ? p : "";

    try {
      var res = await _api.get(
          "/heroes/query/${query.field}/${query.opr.value()}/${query.value}$p");

      return ResponseSuperheroesModel.fromJson(res.data);
    } catch (e) {
      return ResponseSuperheroesModel(false, e.toString());
    }
  }
}
