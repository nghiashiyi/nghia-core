import 'package:adroit_flutter/core/navigation/navigation_service.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// Middleware to catch request and response
class QueryInterceptor extends InterceptorsWrapper {
  static final String _contentType = 'content-type';
  static final String _applicationJson = 'application/json';
  static final String _authorization = 'Authorization';
  static final String _bearer = 'Bearer';

  final String? identityBaseUrl;
  final bool expectResponseJson;

  /// [ignoreToken] is true. Then we don't need to pass access token to headers.
  /// Default is false.
  ///
  final bool ignoreToken;

  final Connectivity connectivity = Connectivity();

  final bool ignoreConnection;

  QueryInterceptor(
      {this.expectResponseJson = false,
      this.identityBaseUrl,
      this.ignoreConnection = false,
      this.ignoreToken = false});

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (!ignoreConnection) {
      final result = await connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        return _validateConnection(options, handler);
      }
    }
    if (!ignoreToken) {
      // final accessToken = await authenticationLocalRepository.getAccessToken();
      // options.headers
      //     .addAll(<String, String>{_authorization: '$_bearer $accessToken'});
    }
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    final shouldRefreshToken = await _shouldRefresh(response);
    if (shouldRefreshToken != null) {
      return _refreshTokenThenRetryingAgain(response,
          refreshToken: shouldRefreshToken);
    }
    if (!isResponseOkButNoContent(response) && expectResponseJson) {
      throw DioError(
        requestOptions: response.requestOptions,
        response: response,
        type: DioErrorType.response,
        error: 'Response format is not a json response',
      );
    }

    return super.onResponse(response, handler);
  }

  /// Return null if it shouldn't refresh.
  /// Otherwise, return refresh token.
  ///
  Future<String?> _shouldRefresh(Response? response) async {
    if (response?.statusCode != 401) {
      return null;
    }
    // final refreshToken = await authenticationLocalRepository.getRefreshToken();
    // if (refreshToken == null) {
    //   return null;
    // }
    // return refreshToken;
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    final shouldRefreshToken = await _shouldRefresh(err.response);
    if (shouldRefreshToken != null) {
      try {
        return handler.resolve(await _refreshTokenThenRetryingAgain(
            err.response,
            refreshToken: shouldRefreshToken));
      } catch (error, stackTrace) {
        return super.onError(err, handler);
      }
    }
    return super.onError(err, handler);
  }

  bool isResponseOkButNoContent(Response response) =>
      response.statusCode == 204;
  bool? isResponseHeaderTypeJson(Map<String, List<String>> headerMap) {
    return headerMap[_contentType]
        ?.firstWhere((element) => element.contains(_applicationJson),
            orElse: () => '')
        .contains(_applicationJson);
  }

  Future _refreshTokenThenRetryingAgain(Response<dynamic>? response,
      {required String refreshToken}) async {
    try {
      // final _refreshDio = Dio();
      // _refreshDio.interceptors.add(CurlLogInterceptor());
      // final refreshTokenResponse =
      //     await Api(_refreshDio, baseUrl: identityBaseUrl).refreshToken(
      //         postBody: RefreshTokenRequestModel(refreshToken: refreshToken));
      // await authenticationLocalRepository.saveRefreshToken(
      //     refreshToken: refreshTokenResponse.refreshToken);
      // await authenticationLocalRepository.saveAccessToken(
      //     token: refreshTokenResponse.accessToken);
      //
      // final _newHeaders = {
      //   ...response.requestOptions.headers,
      //   _authorization: '$_bearer ${refreshTokenResponse.accessToken}'
      // };
      // final _dio = Dio(BaseOptions(baseUrl: response.requestOptions.baseUrl));
      // _dio.interceptors.add(CurlLogInterceptor());
      // return await _dio.request(
      //   response.requestOptions.path,
      //   cancelToken: response.requestOptions.cancelToken,
      //   data: response.requestOptions.data,
      //   onReceiveProgress: response.requestOptions.onReceiveProgress,
      //   onSendProgress: response.requestOptions.onSendProgress,
      //   queryParameters: response.requestOptions.queryParameters,
      //   options: Options(headers: _newHeaders));
    } on DioError catch (e, s) {
      print(e);
      print(s);
      rethrow;
    }
  }

  Future _validateConnection(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (NavigationService.globalNavigatorKey.currentContext == null) {
      return;
    }
    return showDialog(
        context: NavigationService.globalNavigatorKey.currentContext!,
        barrierDismissible: false,
        builder: (context) {
          return Container();
        }).then((v) {
      return onRequest(options, handler);
    });
  }
}
