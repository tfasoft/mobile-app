import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio();

  final _baseUrl = 'http://172.20.10.3:9000/api';

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
  Future<Response> register(String uid, Map userData) async {
    Map data = {
      "uid": uid,
      "data": userData,
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

  Future<Response> changeUserData(String uid, Map newData) async {
    Map data = {
      "uid": uid,
      "data": newData,
    };

    Response response;

    try {
      response = await _dio.put('$_baseUrl/user/user/update', data: data);

      return response;
    } on DioError catch (e) {
      response = e.response!;

      return response;
    }
  }
}
