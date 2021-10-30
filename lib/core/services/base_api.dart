import 'package:adroit_flutter/core/interceptor/curl_log_interceptor.dart';
import 'package:adroit_flutter/core/interceptor/query_interceptor.dart';
import 'package:adroit_flutter/core/services/api.dart';
import 'package:dio/dio.dart';

abstract class BaseApi {
  late final Api _apiClient;

  /// [identityBaseUrl] use for refreshing token later
  ///
  BaseApi(String baseUrl,
      {String? identityBaseUrl,
      bool disableRequestBodyLogging: false,
      bool ignoreToken: false,
      bool ignoreConnection: false}) {
    final dio = Dio();
    dio.interceptors
        .add(CurlLogInterceptor(disableRequestBody: disableRequestBodyLogging));
    dio.interceptors.add(QueryInterceptor(
      identityBaseUrl: identityBaseUrl,
      ignoreConnection: ignoreConnection,
      ignoreToken: ignoreToken,
    ));
    _apiClient = Api(dio, baseUrl: baseUrl);
  }

  Api get apiClient => _apiClient;
}
