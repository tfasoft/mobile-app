import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio();

  final _baseUrl = 'http://192.168.1.5:8000/api';

  Future<Response> login(String email, String password) async {
    Map data = {
      "email": email,
      "password": password,
    };

    Response response;

    try {
      response = await _dio.post('${_baseUrl}/mobile/auth', data: data);
      
      return response;
    } on DioError catch (e) {
      response = e.response!;

      return response;
    }
  }

  Future<Response> connect(String mcode) async {
    Map data = {
      "mcode": mcode,
    };

    Response response;

    try {
      response = await _dio.post('${_baseUrl}/mobile/connect', data: data);

      return response;
    } on DioError catch (e) {
      response = e.response!;

      return response;
    }
  }
}
