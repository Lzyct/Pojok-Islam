part of 'prayer_time_bloc.dart';

@immutable
abstract class PrayerTimeEvent extends Equatable {
  const PrayerTimeEvent();
}

class GetPrayerMonthEvent extends PrayerTimeEvent {
  final Map _params;
  const GetPrayerMonthEvent(this._params);

  @override
  // TODO: implement props
  List<Object> get props => [_params];
}

class GetPrayerTodayEvent extends PrayerTimeEvent {
  final Map _params;
  const GetPrayerTodayEvent(this._params);

  @override
  // TODO: implement props
  List<Object> get props => [_params];
}
