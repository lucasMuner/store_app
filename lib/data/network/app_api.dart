import 'package:dio/dio.dart';
import 'package:flutter_advanced_app/app/constant.dart';
import 'package:retrofit/retrofit.dart';

import '../responses/responses.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/customers/login")
  Future<AuthentificationResponse> login();
}
