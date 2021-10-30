import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart' as retrofit;

part 'api.g.dart';

@retrofit.RestApi()
abstract class Api {
  factory Api(Dio dio, {required String baseUrl}) = _Api;

  @retrofit.GET('/get-sample')
  Future<void> getSample({
    @retrofit.Query('something') required String something,
  });

  @retrofit.POST('/post-sample')
  Future<void> postSample({
    @retrofit.Body() required Map<String, dynamic> postBody,
  });
}
