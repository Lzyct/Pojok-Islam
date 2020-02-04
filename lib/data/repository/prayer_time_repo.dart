import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:pojok_islam/data/models/entity/prayer_time_entity.dart';
import 'package:pojok_islam/data/source/local/prayer_time_db.dart';
import 'package:pojok_islam/data/source/rest/pojok_islam_client.dart';

///*********************************************
/// Created by ukietux on 2019-12-24 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2019 | All Right Reserved
class PrayerTimeRepo {
  final PojokIslamClient pojokIslamClient;
  final PrayerTimeDb prayerTimeDb;

  PrayerTimeRepo({@required this.pojokIslamClient, @required this.prayerTimeDb})
      : assert(pojokIslamClient != null && prayerTimeDb != null);

  Future<List<PrayerTimeEntity>> getPrayerMonth(
      Map<String, String> _params, DateTime dateTime) async {

    //parse input date
    var _formatter = DateFormat('MM-yyyy');
    var _monthYear = _formatter.format(dateTime).split("-");
    _params['month'] = _monthYear[0];
    _params['year'] = _monthYear[1];


    Logger().d("repoPrayerTime");
    //check prayer time in db first
    prayerTimeDb.getPrayerMonth().then((prayer) async {
      Logger().e("lenght ${prayer.length}");
      if (prayer.length <= 0) {
        await pojokIslamClient
            .getPrayerMonth(_params)
            .then((response) => {prayerTimeDb.getPrayerMonth()});
      }
    });

    return prayerTimeDb.getPrayerMonth();
  }

  Future<PrayerTimeEntity> getPrayerToday(
      Map<String, String> _params, DateTime dateTime) async {
    //check prayer time in db first
    try {
      await prayerTimeDb.getPrayerToday().then((prayer) async {
        if (prayer == null) {
          //if null get from API then save into db
          Logger().d("prayer is null");
          //parse input date
          var _formatter = DateFormat('MM-yyyy');
          var _monthYear = _formatter.format(dateTime).split("-");
          _params['month'] = _monthYear[0];
          _params['year'] = _monthYear[1];

          await pojokIslamClient.getPrayerMonth(_params).then((response) async {
            Logger().d("isSuccess $response");
            await prayerTimeDb.savePrayerTime(response);
          }).catchError((error) {
            Logger().d("isError $error");
          });
        }
      });
    } catch (e) {
      Logger().e(e);
    }
    return prayerTimeDb.getPrayerToday();
  }
}
