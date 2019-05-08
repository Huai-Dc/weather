/**
 * created by Huai 2019/5/8 0008
 */
import 'dart:async';
import 'package:dio/dio.dart';

var dio = new Dio();

class NetUtils {
  static Future post(String url, {Map<String, dynamic> params}) async {
    try {
      var response = await dio.post(url, data: params);
      return response.data;
    } catch (ex) {
      print(ex);
    }
    return {};
  }

  static Future get(String path, {Map<String, dynamic> params}) async {
    var response = await dio.get(path, queryParameters: params);
    return response.data;
  }
}
