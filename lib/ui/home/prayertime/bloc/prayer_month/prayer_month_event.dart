part of 'prayer_month_bloc.dart';

@immutable
abstract class PrayerMonthEvent extends Equatable {
  const PrayerMonthEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class NextMonthState extends PrayerMonthEvent {
  final String lastSelectedMonth;

  const NextMonthState(this.lastSelectedMonth)
      : assert(lastSelectedMonth != null);
}

class PreviousMonthState extends PrayerMonthEvent {
  final String lastSelectedMonth;

  const PreviousMonthState(this.lastSelectedMonth)
      : assert(lastSelectedMonth != null);
}

class CurrentMonthState extends PrayerMonthEvent {}
