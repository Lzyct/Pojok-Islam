part of 'prayer_month_bloc.dart';

@immutable
abstract class PrayerMonthState {

}

class GetPrayerMonthState extends PrayerMonthState {
  final List<PrayerTimeEntity> _prayerTimeEntity;

  GetPrayerMonthState(this._prayerTimeEntity)
      : assert(_prayerTimeEntity != null);
}

class GetSelectedMonth extends PrayerMonthState {
  final String selectedMonth;

  GetSelectedMonth(this.selectedMonth) : assert(selectedMonth != null);
}
