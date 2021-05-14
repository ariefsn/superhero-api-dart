import 'package:dio/dio.dart';

class BaseApi {
  Dio api;
  final Function(RequestOptions options, RequestInterceptorHandler handler) onRequest;
  final Function(Response<dynamic> response, ResponseInterceptorHandler handler) onResponse;
  final Function(DioError error, ErrorInterceptorHandler handler) onError;

  BaseApi(String url, {
    this.onRequest, this.onResponse, this.onError
  }) {
    var options = BaseOptions(
      baseUrl: url,
    );

    api = Dio(options);

    api.interceptors.add(InterceptorsWrapper(
        onRequest:(options, handler){
          if (onRequest != null) {
            onRequest(options, handler);
          }

          return handler.next(options);
        },
        onResponse:(response, handler) {
          if (onResponse != null) {
            onResponse(response, handler);
          }

          return handler.next(response);
        },
        onError: (DioError e, handler) {
          if (onError != null) {
            onError(e, handler);
          }

          return  handler.next(e);
        }
    ));
  }
}