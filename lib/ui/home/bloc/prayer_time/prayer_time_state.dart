part of 'prayer_time_bloc.dart';

@immutable
abstract class PrayerTimeState extends Equatable {
  const PrayerTimeState();

  @override
  List<Object> get props => [];
}

class LoadingState extends PrayerTimeState {}

class GetPrayerMonthState extends PrayerTimeState {
  final ResponsePrayerMonth responsePrayerMonth;

  GetPrayerMonthState(this.responsePrayerMonth)
      : assert(responsePrayerMonth != null);

  @override
  List<Object> get props => [responsePrayerMonth];
}

class GetPrayerTodayState extends PrayerTimeState {
  final ResponsePrayerToday responsePrayerToday;

  GetPrayerTodayState(this.responsePrayerToday)
      : assert(responsePrayerToday != null);

  @override
  List<Object> get props => [responsePrayerToday];
}
