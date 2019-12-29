import 'package:dio/dio.dart';

///*********************************************
/// Created by ukietux on 2019-12-29 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2019 | All Right Reserved
class App {
  Dio dio;

  App(this.dio) {
    dio.options
      ..baseUrl = "http://pojok-islam.ngrok.io/"
      ..connectTimeout = 5000 //5s
      ..receiveTimeout = 5000
      ..validateStatus = (int status) {
        return status > 0;
      }
      ..headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
      };
  }
}
