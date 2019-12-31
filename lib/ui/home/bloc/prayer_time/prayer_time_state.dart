part of 'prayer_time_bloc.dart';

@immutable
abstract class PrayerTimeState extends Equatable {
  const PrayerTimeState();

  @override
  List<Object> get props => [];
}

class PrayerLoadingState extends PrayerTimeState {}

class GetPrayerMonthState extends PrayerTimeState {
  final List<PrayerTimeEntity> prayerTimeEntity;

  GetPrayerMonthState(this.prayerTimeEntity) : assert(prayerTimeEntity != null);

  @override
  List<Object> get props => [prayerTimeEntity];
}

class GetPrayerTodayState extends PrayerTimeState {
  final PrayerTimeEntity prayerTimeEntity;

  GetPrayerTodayState(this.prayerTimeEntity) : assert(prayerTimeEntity != null);

  @override
  List<Object> get props => [prayerTimeEntity];
}
