import 'dart:convert';

import 'package:dio/dio.dart';

import 'dio/dio_settings.dart';

class ServerApi {
  static ServerApi _instance = new ServerApi.internal();

  factory ServerApi() => _instance;

  ServerApi.internal() {
    _dioSettings = DioSettings();
    _dio = _dioSettings.dio;
  }

  late DioSettings _dioSettings;
  late Dio _dio;

  // late Map<String, dynamic> _request;

  Future<String> login({
    required String username,
    required String password,
  }) async {
    try {
      final authResponse = await _dio.post(
        "/users/login/",
        data: {
          'username': username,
          "password": password,
        },
      );
      return authResponse.data['token'].toString();
    } catch (e) {
      throw e;
    }
    // return loginFromJson(authResponse.toString());
  }

  // Future<List<Category>> getAllCategory(String locale) async {
  //   try {
  //     Response<String> response = await _dio.get(
  //       "/category/list",
  //        queryParameters: {"lang": 'kg'});
  //     return categoryFromJson(response.toString());
  //   } catch (e) {
  //     throw e;
  //   }
  // }

}
