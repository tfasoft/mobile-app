import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio();

  final _baseUrl = 'http://192.168.1.5:9000/api';

  // Login user with email and password
  Future<Response> login(String email, String password) async {
    Map data = {
      "email": email,
      "password": password,
    };

    Response response;

    try {
      response = await _dio.post('$_baseUrl/mobile/mobile/login', data: data);
      
      return response;
    } on DioError catch (e) {
      response = e.response!;

      return response;
    }
  }

  // Register user with email and password
  Future<Response> register(String id, String email, String password) async {
    Map data = {
      "id": id,
      "data": {
        "email": email,
        "password": password,
      }
    };

    Response response;

    try {
      response = await _dio.post('$_baseUrl/mobile/mobile/register', data: data);

      return response;
    } on DioError catch (e) {
      response = e.response!;

      return response;
    }
  }

  // Connect to API with M-Code
  Future<Response> connect(String mcode) async {
    Map data = {
      "mcode": mcode,
    };

    Response response;

    try {
      response = await _dio.post('$_baseUrl/mobile/mobile/connect', data: data);

      return response;
    } on DioError catch (e) {
      response = e.response!;

      return response;
    }
  }

  // Get user data
  Future<Response> getUser(String uid) async {
    Map data = {
      "uid": uid,
    };

    Response response;

    try {
      response = await _dio.post('$_baseUrl/user/user/get', data: data);

      return response;
    } on DioError catch (e) {
      response = e.response!;

      return response;
    }
  }

  // Get the user token
  Future<Response> getLoginToken(String tid) async {
    Map data = {
      "tid": tid,
    };

    Response response;

    try {
      response = await _dio.post('$_baseUrl/user/user/login', data: data);

      return response;
    } on DioError catch (e) {
      response = e.response!;

      return response;
    }
  }

  Future<Response> regenerateMCode(String uid) async {
    Map data = {
      "uid": uid,
    };

    Response response;

    try {
      response = await _dio.post('$_baseUrl/user/user/mcode/regenerate', data: data);

      return response;
    } on DioError catch (e) {
      response = e.response!;

      return response;
    }
  }
}
