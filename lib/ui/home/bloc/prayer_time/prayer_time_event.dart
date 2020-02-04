part of 'prayer_time_bloc.dart';

@immutable
abstract class PrayerTimeEvent extends Equatable {
  const PrayerTimeEvent();
}

class GetPrayerMonthEvent extends PrayerTimeEvent {
  final Map _params;
  final DateTime _dateTime;
  const GetPrayerMonthEvent(this._params,this._dateTime);

  @override
  // TODO: implement props
  List<Object> get props => [_params,_dateTime];
}

class GetPrayerTodayEvent extends PrayerTimeEvent {
  final Map _params;
  final DateTime _dateTime;
  const GetPrayerTodayEvent(this._params,this._dateTime);

  @override
  // TODO: implement props
  List<Object> get props => [_params,_dateTime];
}
