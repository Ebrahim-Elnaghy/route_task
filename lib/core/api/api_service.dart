import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiService {
  final Dio _dio;

  final _baseUrl = "https://dummyjson.com";

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}
