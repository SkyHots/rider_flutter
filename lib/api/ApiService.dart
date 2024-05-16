import 'package:dio/dio.dart';

class ApiService {

  static final Dio _dio = Dio();

  static Future<Response> get(String url) async {
    try {
      Response response = await _dio.get(url);
      return response;
    } catch (error) {
      throw Exception('Failed to make GET request');
    }
  }

  static Future<Response> post(String url, dynamic data) async {
    try {
      Response response = await _dio.post(url, data: data);
      return response;
    } catch (error) {
      throw Exception('Failed to make POST request');
    }
  }


  static Future<Response> put(String url, dynamic data) async {
    print(data.toString());
    try {
      Response response = await _dio.put(url, data: data);
      return response;
    } catch (error) {
      throw Exception('Failed to make put request');
    }
  }

  static Future<Response> delete(String url, dynamic data) async {
    try {
      Response response = await _dio.delete(url, data: data);
      return response;
    } catch (error) {
      throw Exception('Failed to make delete request');
    }
  }
}
