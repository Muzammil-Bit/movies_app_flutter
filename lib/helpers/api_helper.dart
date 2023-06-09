import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:movie_app/config/constants.dart';

class ApiHelper {
  static Future<Map<String, dynamic>> get({required String url, Map<String, dynamic>? data, bool isProtected = true}) async {
    try {
      if (data == null) {
        data = {};
      }

      data.addIf(isProtected, 'api_key', '8c6bc5619456043497d3d15db6ce3d67');

      String finalUrl = kBaseURL + url;
      var response = await Dio().get(finalUrl, queryParameters: data);

      return response.data as Map<String, dynamic>;
    } catch (e) {
      print("Exception In API -> ${kBaseURL + url} -> ${data} -> ${e.toString()}");
      rethrow;
    }
  }
}
