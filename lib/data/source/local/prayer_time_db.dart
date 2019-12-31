import 'dart:async';

import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:pojok_islam/data/models/entity/prayer_time_entity.dart';
import 'package:pojok_islam/data/models/response/response_prayer_month.dart';
import 'package:pojok_islam/di/db_helper.dart';
import 'package:pojok_islam/di/pref_manager.dart';
import 'package:pojok_islam/main.dart';

///*********************************************
/// Created by ukietux on 2019-12-30 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2019 | All Right Reserved
class PrayerTimeDb {
  Future<PrayerTimeEntity> getPrayerToday() async {
    var currentLocation =
        getIt<PrefManager>().getLastLocation().replaceAll(" ", "").split(",");
    var kota = currentLocation[0];
    var negara = currentLocation[1];
    var method = getIt<PrefManager>().getCurrentMethod();

    //connect db
    var dbClient = await getIt.get<DbHelper>().dataBase;
    //get current day
    var currentDate = DateFormat("dd-MM-yyyy").format(DateTime.now());
    Logger().d(
        "SELECT * FROM PrayerTime WHERE masehi = '$currentDate' and kota='$kota' and negara='$negara' and method='$method'");
    List<Map> queryMap = await dbClient.rawQuery(
        "SELECT * FROM PrayerTime WHERE masehi = '$currentDate' and kota='$kota' and negara='$negara' and method='$method' limit 1");

    Logger().d("queryMap $queryMap");
    if (queryMap.isEmpty) {
      PrayerTimeEntity prayerTimeEntity;
      return prayerTimeEntity;
    } else
      return PrayerTimeEntity(
          queryMap[0]["timestamp"],
          queryMap[0]["waktuShalat"],
          queryMap[0]["hijriah"],
          queryMap[0]["masehi"],
          queryMap[0]["detailHijriah"],
          queryMap[0]["detailMasehi"],
          queryMap[0]["kota"],
          queryMap[0]["negara"],
          queryMap[0]["method"],
          queryMap[0]["holidays"]);
  }

  Future<List<PrayerTimeEntity>> getPrayerMonth() async {
    var currentLocation =
        getIt<PrefManager>().getLastLocation().replaceAll(" ", "").split(",");
    var kota = currentLocation[0];
    var negara = currentLocation[1];
    var method = getIt<PrefManager>().getCurrentMethod();

    var dbClient = await getIt.get<DbHelper>().dataBase;
    //get current day
    var currentMonth = DateFormat("MM").format(DateTime.now());
    List<Map> queryMap = await dbClient.rawQuery(
        "SELECT * FROM PrayerTime WHERE masehi like '%-$currentMonth-%' and kota='$kota' and negara ='$negara' and method='$method'");
    List<PrayerTimeEntity> listPrayerTime = new List();
    for (int i = 0; i < queryMap.length; i++) {
      listPrayerTime.add(PrayerTimeEntity(
          queryMap[i]["timestamp"],
          queryMap[i]["waktuShalat"],
          queryMap[i]["hijriah"],
          queryMap[i]["masehi"],
          queryMap[i]["detailHijriah"],
          queryMap[i]["detailMasehi"],
          queryMap[0]["kota"],
          queryMap[0]["negara"],
          queryMap[0]["method"],
          queryMap[0]["holidays"]));
    }
    return listPrayerTime;
  }

  Future<bool> savePrayerTime(ResponsePrayerMonth responsePrayerMonth) async {
    //imestamp INTEGER PRIMARY KEY, waktuShalat TEXT, hijriah TEXT, masehi TEXT,detailHijriah TEXT,detailMasehi TEXT,kota TEXT,negara TEXT,method TEXT
    var dbClient = await getIt.get<DbHelper>().dataBase;
    var currentLocation =
        getIt<PrefManager>().getLastLocation().replaceAll(" ", "").split(",");
    var kota = currentLocation[0];
    var negara = currentLocation[1];
    var method = getIt<PrefManager>().getCurrentMethod();

    for (int i = 0; i < responsePrayerMonth.result.length; i++) {
      await dbClient.transaction((insert) async {
        return insert.rawInsert(
            "INSERT INTO PrayerTime(timestamp,waktushalat,hijriah,masehi,detailHijriah,detailMasehi,holidays,kota,negara,method) VALUES ("
            "${responsePrayerMonth.result[i].tanggal.timestamp},"
            "'${responsePrayerMonth.result[i].waktuShalat.Subuh.split(" ")[0]};"
            "${responsePrayerMonth.result[i].waktuShalat.Shuruq.split(" ")[0]};"
            "${responsePrayerMonth.result[i].waktuShalat.Dzuhur.split(" ")[0]};"
            "${responsePrayerMonth.result[i].waktuShalat.Ashr.split(" ")[0]};"
            "${responsePrayerMonth.result[i].waktuShalat.Maghrib.split(" ")[0]};"
            "${responsePrayerMonth.result[i].waktuShalat.Isya.split(" ")[0]}',"
            "'${responsePrayerMonth.result[i].tanggal.hijriah}',"
            "'${responsePrayerMonth.result[i].tanggal.masehi}',"
            "'${responsePrayerMonth.result[i].tanggal.detailHijriah.tanggal};"
            "${responsePrayerMonth.result[i].tanggal.detailHijriah.bulan.replaceAll("'", "''")};"
            "${responsePrayerMonth.result[i].tanggal.detailHijriah.hari.replaceAll("'", "''")};"
            "${responsePrayerMonth.result[i].tanggal.detailHijriah.tahun}',"
            "'${responsePrayerMonth.result[i].tanggal.detailMasehi.tanggal};"
            "${responsePrayerMonth.result[i].tanggal.detailMasehi.bulan};"
            "${responsePrayerMonth.result[i].tanggal.detailMasehi.hari};"
            "${responsePrayerMonth.result[i].tanggal.detailMasehi.tahun}',"
            "'${responsePrayerMonth.result[i].tanggal.holidays.toString()}',"
            "'$kota',"
            "'$negara',"
            "'$method'"
            ");");
      });
    }
    return true;
  }
}
