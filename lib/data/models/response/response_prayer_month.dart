import 'package:pojok_islam/data/models/response/diagnostic.dart';

class ResponsePrayerMonth {
  Diagnostic diagnostic;
  List<Result> result;

  ResponsePrayerMonth.fromJsonMap(Map<String, dynamic> map)
      : diagnostic = Diagnostic.fromJsonMap(map["diagnostic"]),
        result = List<Result>.from(
            map["result"].map((it) => Result.fromJsonMap(it)));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['diagnostic'] = diagnostic == null ? null : diagnostic.toJson();
    data['result'] =
        result != null ? this.result.map((v) => v.toJson()).toList() : null;
    return data;
  }
}

class Result {
  WaktuShalat waktuShalat;
  Tanggal tanggal;

  Result.fromJsonMap(Map<String, dynamic> map)
      : waktuShalat = WaktuShalat.fromJsonMap(map["waktuShalat"]),
        tanggal = Tanggal.fromJsonMap(map["tanggal"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['waktuShalat'] = waktuShalat == null ? null : waktuShalat.toJson();
    data['tanggal'] = tanggal == null ? null : tanggal.toJson();
    return data;
  }
}

class Tanggal {
  String timestamp;
  String hijriah;
  DetailHijriah detailHijriah;
  String masehi;
  DetailMasehi detailMasehi;
  List<Object> holidays;

  Tanggal.fromJsonMap(Map<String, dynamic> map)
      : timestamp = map["timestamp"],
        hijriah = map["hijriah"],
        detailHijriah = DetailHijriah.fromJsonMap(map["detailHijriah"]),
        masehi = map["masehi"],
        detailMasehi = DetailMasehi.fromJsonMap(map["detailMasehi"]),
        holidays = map["holidays"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = timestamp;
    data['hijriah'] = hijriah;
    data['detailHijriah'] =
        detailHijriah == null ? null : detailHijriah.toJson();
    data['masehi'] = masehi;
    data['detailMasehi'] = detailMasehi == null ? null : detailMasehi.toJson();
    data['holidays'] = holidays;
    return data;
  }
}

class WaktuShalat {
  String Subuh;
  String Shuruq;
  String Dzuhur;
  String Ashr;
  String Maghrib;
  String Isya;

  WaktuShalat.fromJsonMap(Map<String, dynamic> map)
      : Subuh = map["Subuh"],
        Shuruq = map["Shuruq"],
        Dzuhur = map["Dzuhur"],
        Ashr = map["Ashr"],
        Maghrib = map["Maghrib"],
        Isya = map["Isya"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Subuh'] = Subuh;
    data['Shuruq'] = Shuruq;
    data['Dzuhur'] = Dzuhur;
    data['Ashr'] = Ashr;
    data['Maghrib'] = Maghrib;
    data['Isya'] = Isya;
    return data;
  }
}

class DetailMasehi {
  String tanggal;
  String bulan;
  String hari;
  String tahun;

  DetailMasehi.fromJsonMap(Map<String, dynamic> map)
      : tanggal = map["tanggal"],
        bulan = map["bulan"],
        hari = map["hari"],
        tahun = map["tahun"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tanggal'] = tanggal;
    data['bulan'] = bulan;
    data['hari'] = hari;
    data['tahun'] = tahun;
    return data;
  }
}

class DetailHijriah {
  String tanggal;
  String bulan;
  String hari;
  String tahun;

  DetailHijriah.fromJsonMap(Map<String, dynamic> map)
      : tanggal = map["tanggal"],
        bulan = map["bulan"],
        hari = map["hari"],
        tahun = map["tahun"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tanggal'] = tanggal;
    data['bulan'] = bulan;
    data['hari'] = hari;
    data['tahun'] = tahun;
    return data;
  }
}
