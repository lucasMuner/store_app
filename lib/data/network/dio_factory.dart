import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_advanced_app/app/app_preferences.dart';
import 'package:flutter_advanced_app/app/constant.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";

class DioFactory {
  AppPreferences _appPreferences;

  DioFactory(this._appPreferences);

  Future<Dio> getDio() async {
    Dio dio = Dio();
    String language = await _appPreferences.getAppLanguage();
    int _timeOut = 60 * 1000;

    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: Constant.token,
      DEFAULT_LANGUAGE: language // todo get leng from prefs
    };

    dio.options = BaseOptions(
        baseUrl: Constant.baseUrl,
        connectTimeout: Duration(milliseconds: _timeOut),
        receiveTimeout: Duration(milliseconds: _timeOut),
        headers: headers);

    if (kReleaseMode) {
      print("release mode logs");
    } else {
      dio.interceptors.add(PrettyDioLogger(
          responseBody: true, requestHeader: true, responseHeader: true));
    }

    return dio;
  }
}
