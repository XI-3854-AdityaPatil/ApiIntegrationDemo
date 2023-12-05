import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiClient {
  static final Dio _dio = Dio();

  static Future<dynamic> get(String url) async {
    try {
      final response = await _dio.get(url);
      return response.data;
    } on DioException catch (e) {
      debugPrint('Error: ${e.message}');
      throw Exception('Failed to fetch data');
    }
  }

  static Future<dynamic> post(
      String url, Map<String, dynamic> inputData) async {
    try {
      final response = await _dio.post(url, data: inputData);
      return response;
    } on DioException catch (e) {
      if(e.response?.statusCode == 400) {
        throw Exception('Bad request',);
      }
      debugPrint('Error: ${e.message}');
      throw Exception('Failed to fetch data');
    }
  }
}
