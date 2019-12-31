///*********************************************
/// Created by ukietux on 2019-12-30 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2019 | All Right Reserved
class PrayerTimeEntity {
  int timestamp;
  String waktuShalat;
  String hijriah;
  String masehi;
  String detailHijriah;
  String detailMasehi;
  String kota;
  String negara;
  String method;
  String holidays;

  PrayerTimeEntity(
      this.timestamp,
      this.waktuShalat,
      this.hijriah,
      this.masehi,
      this.detailHijriah,
      this.detailMasehi,
      this.kota,
      this.negara,
      this.method,
      this.holidays);
}
