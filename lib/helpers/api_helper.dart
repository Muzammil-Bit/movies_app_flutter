import 'package:dio/dio.dart';
import 'package:movie_app/config/constants.dart';

class ApiHelper {
  static Future<Map<String, dynamic>> get({required String url, dynamic data, bool isProtected = true}) async {
    try {
      String finalUrl = kBaseURL + url;
      var response = await Dio().get(finalUrl, queryParameters: data);

      return response.data as Map<String, dynamic>;
    } catch (e) {
      print("Exception In API -> ${kBaseURL + url} -> ${data} -> ${e.toString()}");
      rethrow;
    }
  }
}
