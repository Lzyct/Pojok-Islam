import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:pojok_islam/data/models/models.dart';
import 'package:pojok_islam/data/models/response/response_prayer_today.dart';
import 'package:pojok_islam/data/source/rest/pojok_islam_client.dart';

///*********************************************
/// Created by ukietux on 2019-12-24 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2019 | All Right Reserved
class PrayerTimeRepo {
  final PojokIslamClient pojokIslamClient;

  PrayerTimeRepo({@required this.pojokIslamClient})
      : assert(pojokIslamClient != null);

  Future<ResponsePrayerMonth> getPrayerMonth(
      Map<String, String> _params) async {
    Logger().d("repoPrayerTime");

    return pojokIslamClient.getPrayerMonth(_params);
  }

  Future<ResponsePrayerToday> getPrayerToday(
      Map<String, String> _params) async {
    Logger().d("repoPrayerTime");

    return pojokIslamClient.getPrayerToday(_params);
  }
}
