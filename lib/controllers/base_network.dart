import 'dart:convert';

import 'package:dio/dio.dart';
import '../helpers/box.dart';
import '../models/credentials.dart';
import '../models/auth.dart';
import '../settings/constants.dart' as c;

class UgtBaseNetwork {
  static final String baseUrl = "https://t07.performans.com/uludag/api/";

  //#region FUNCTIONS
  static Map<String, dynamic> _processResponse(Response response) {
    try {
      switch (response.statusCode) {
        case 200:
          if (response.data["success"]) {
            switch (response.data["statusCode"]) {
              case 200:
                if (response.data["data"] != null) {
                  return response.data;
                } else {
                  return {"success": true, "statusCode": response.data["statusCode"]};
                }
                break;
              default:
                return {"success": false, "statusCode": response.data["statusCode"]};
                break;
            }
          } else {
            return {"success": false, "statusCode": response.data["statusCode"]};
          }
          break;
        default:
          return {"success": false, "statusCode": response.statusCode};
      }
    } catch (exception) {
      return {"success": false, "message": exception.toString()};
    }
  }

  static Future<Dio> _getDio() async {
    Dio dio = Dio();
    dio.options.contentType = "application/json";
    dio.options.followRedirects = false;
    return dio;
  }

  static Future<Dio> _getDioWithToken() async {
    String _token = Box.readToken();
    Dio _dio = await _getDio();
    _dio.options.headers["Authorization"] = "Bearer $_token";
    return _dio;
  }

  static Future<Map<String, dynamic>> _get(String partUrl) async {
    final fullUrl = "$baseUrl$partUrl";
    try {
      var _dio = await _getDio();
      final response = await _dio.get(fullUrl);
      return _processResponse(response);
    } catch (exception) {
      return {"success": false, "message": exception.toString()};
    }
  }

  static Future<Map<String, dynamic>> _getWithToken(String partUrl) async {
    final fullUrl = "$baseUrl$partUrl";
    try {
      var _dio = await _getDioWithToken();
      final response = await _dio.get(fullUrl);
      return _processResponse(response);
    } catch (exception) {
      return {"success": false, "message": exception.toString()};
    }
  }

  static Future<Map<String, dynamic>> _post(String partUrl, Map<String, dynamic> data) async {
    final fullUrl = "$baseUrl$partUrl";
    try {
      var _dio = await _getDio();
      final response = await _dio.post(fullUrl, data: data);
      return _processResponse(response);
    } on DioError catch (error) {
      return {"success": false, "message": error.toString()};
    }
  }

  static Future<Map<String, dynamic>> _postWithToken(String partUrl, Map<String, dynamic> data) async {
    final fullUrl = "$baseUrl$partUrl";
    try {
      var _dio = await _getDioWithToken();
      //TODO: remove printLog below
      print("POST: $fullUrl ${json.encode(data)}");
      final response = await _dio.post(fullUrl, data: data);
      return _processResponse(response);
    } catch (exception) {
      return {"success": false, "message": exception.toString()};
    }
  }
  //#endregion

  //#region USER
  static Future<Auth> userSignin(Credentials credentials) async {
    Map<String, dynamic> data = {
      "email": credentials.username,
      "password": credentials.password,
    };
    var response = await _post(c.URL_USER_SIGNIN, data);
    if (response["success"] == false) return null;
    var profile = Auth.fromMap(response["data"]);
    if (profile != null) Box.writeAuth(profile);
    return profile;
  }
  //#endregion
}
