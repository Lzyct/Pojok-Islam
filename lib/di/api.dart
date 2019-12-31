import 'package:dio/dio.dart';

///*********************************************
/// Created by ukietux on 2019-12-29 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2019 | All Right Reserved
class API {
  Dio dio;

  API(this.dio) {
    dio.options
      ..baseUrl = "http://pojok-islam.ngrok.io/"
      ..connectTimeout = 60000 //5s
      ..receiveTimeout = 60000
      ..validateStatus = (int status) {
        return status > 0;
      }
      ..headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
      };
  }
}
