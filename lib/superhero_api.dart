library superhero_api;

import 'package:dio/dio.dart';
import 'package:superhero_api/api/appearance_api.dart';
import 'package:superhero_api/api/base_api.dart';
import 'package:superhero_api/api/hero_api.dart';
import 'package:superhero_api/api/origin_api.dart';
import 'package:superhero_api/api/super_power_api.dart';

/// A SuperheroApi.
class SuperheroApi {
  HeroApi hero;
  AppearanceApi appearance;
  OriginApi origin;
  SuperPowerApi superPower;

  SuperheroApi(String url, {
    Function(RequestOptions options, RequestInterceptorHandler handler) onRequest,
    Function(Response<dynamic> response, ResponseInterceptorHandler handler) onResponse,
    Function(DioError error, ErrorInterceptorHandler handler) onError
  }) {
    var api = BaseApi(url, onRequest: onRequest, onResponse: onResponse, onError: onError);

    hero = HeroApi(api);
    appearance = AppearanceApi(api);
    origin = OriginApi(api);
    superPower = SuperPowerApi(api);
  }

}
