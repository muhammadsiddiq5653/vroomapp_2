import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as getx;
import '../../main.dart';
import '../app_api_url.dart';
import 'settings_service.dart';

class NetworkService extends getx.GetxService {
  final int TIMEOUT = kReleaseMode ? 60000 : 60000;
  final SettingsService settingsService = getx.Get.put(SettingsService());
  late Dio dio;
  @override
  onInit() {
    super.onInit();
    dio = Dio(BaseOptions(
        baseUrl: AppApiUrl.rootUrl,
        connectTimeout: TIMEOUT,
        receiveTimeout: TIMEOUT,
        sendTimeout: TIMEOUT));

    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (requesOptions, handler) {
      //Add access Token if exist
      requesOptions.queryParameters.addAll({
        'app_version_number': packageInfo.version,
        'app_build_number': packageInfo.buildNumber,
      });
      if (!requesOptions.headers.containsKey(HttpHeaders.authorizationHeader)) {
        requesOptions.headers[HttpHeaders.authorizationHeader] =
            "Bearer ${settingsService.authModel?.accessToken}";
      }
      handler.next(requesOptions);
    }, onError: (DioError e, handler) {
      if (e.message.contains('SocketException') == true) {
        throw Exception(
            'Seems like you dont have internet connections, please check your network');
      }
      print(e.response?.data);
      if (e.response?.data != null &&
          e.response?.data is Map &&
          e.response?.data["error"] != null) {
        var errorMessage = e.response!.data["error"];
        var error =
            DioError(requestOptions: e.requestOptions, error: errorMessage);
        return handler.next(error);
      } else if (e.response?.data != null) {
        var errorMessage = e.response!.data;
        var error =
            DioError(requestOptions: e.requestOptions, error: errorMessage);
        return handler.next(error);
      }
      return handler.next(e);
    }));
  }

  Future<Response> get(String url,
      {Map<String, dynamic>? query, Map<String, dynamic>? headers}) async {
    return await dio.get(url,
        queryParameters: query, options: Options(headers: headers));
  }

  Future<Response> delete(String url,
      {Map<String, dynamic>? query, Map<String, dynamic>? headers}) async {
    return await dio.delete(url,
        queryParameters: query, options: Options(headers: headers));
  }


  //{"id":12,"name":"Ashell","email":"S@gmail.com","phone_code":null,"phone":null,"avatar":"","access_token":"KjXK2EXXcqo0kcMDbL84Di1h8rrN9cX0ZZbPJZy6","access_token_orig":"21|KjXK2EXXcqo0kcMDbL84Di1h8rrN9cX0ZZbPJZy6","total_price":null}ash
  Future<Response> post(String url, {Map<String, dynamic>? query, data}) async {
    var request = await dio.post(url, queryParameters: query, data: data);
    return request;
  }

  Future<Response> put(String url, {Map<String, dynamic>? query, data}) async {
    var request = await dio.put(url, queryParameters: query, data: data);
    return request;
  }

  Future<Response> uploadFile(String url,
      {Map<String, dynamic>? query, required String image}) async {
    String fileName = image.split('/').last;
    var file = await MultipartFile.fromFile(image, filename: fileName);
    FormData formData = FormData.fromMap({
      "upload": file,
    });
    var request = await dio.post(url,
        queryParameters: query,
        data: formData,
        options:
            Options(headers: {Headers.contentTypeHeader: "application/json"}));
    return request;
  }
}
