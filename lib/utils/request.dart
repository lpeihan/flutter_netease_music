import 'dart:async';
import 'package:dio/dio.dart';

class Http {
  Dio dio;

  Http() {
    dio = new Dio();

    dio.options.receiveTimeout = 5000;
    dio.options.connectTimeout = 3000;
    dio.options.baseUrl = 'http://47.98.144.117:3000/banner';
  }

  request(String path, { Map data, Options options }) async {
    Response request = await dio.request(path, data: data, options: options);
    
    return request;
  }
}