import 'package:dio/dio.dart';

// with default Options
Dio dio(){
  var dio =Dio();
  //ios
//  dio.options.baseUrl = 'http://localhost:8000/api';
  //android
  dio.options.baseUrl = 'http://10.0.2.2:8000/api';
  dio.options.headers['accept']='Application/json';
  return dio;
}



