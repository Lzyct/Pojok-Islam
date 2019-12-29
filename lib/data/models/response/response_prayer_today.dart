import 'package:pojok_islam/data/models/response/diagnostic.dart';
import 'package:pojok_islam/data/models/response/response_prayer_month.dart';

class ResponsePrayerToday {
  Diagnostic diagnostic;
  Result result;

  ResponsePrayerToday.fromJsonMap(Map<String, dynamic> map)
      : diagnostic = Diagnostic.fromJsonMap(map["diagnostic"]),
        result = Result.fromJsonMap(map["result"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['diagnostic'] = diagnostic == null ? null : diagnostic.toJson();
    data['result'] = result == null ? null : result.toJson();
    return data;
  }
}
