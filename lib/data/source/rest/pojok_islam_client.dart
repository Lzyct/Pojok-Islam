import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:pojok_islam/data/models/response/response_prayer_month.dart';
import 'package:pojok_islam/data/models/response/response_prayer_today.dart';
import 'package:pojok_islam/di/app.dart';
import 'package:pojok_islam/main.dart';

///*********************************************
/// Created by ukietux on 2019-12-24 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2019 | All Right Reserved

class PojokIslamClient {
  Future<ResponsePrayerMonth> getPrayerMonth(Map<String, String> params) async {
    try {
      var app = getIt.get<App>();
      Response response =
          await app.dio.get("prayerTime/month", queryParameters: params);
      Logger().d("response $response");
      return ResponsePrayerMonth.fromJsonMap(response.data);
    } catch (e) {
      Logger().d("debug : $e");
      return null;
    }
  }

  Future<ResponsePrayerToday> getPrayerToday(Map<String, String> params) async {
    try {
      var app = getIt.get<App>();
      Response response =
          await app.dio.get("prayerTime/today", queryParameters: params);
      Logger().d("response $response");
      return ResponsePrayerToday.fromJsonMap(response.data);
    } catch (e) {
      Logger().d("debug : $e");
      return null;
    }
  }
}
