import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:pojok_islam/data/models/entity/prayer_time_entity.dart';
import 'package:pojok_islam/data/repository/prayer_time_repo.dart';

part 'prayer_month_event.dart';

part 'prayer_month_state.dart';

class PrayerMonthBloc extends Bloc<PrayerMonthEvent, PrayerMonthState> {
  final PrayerTimeRepo prayerTimeRepo;

  PrayerMonthBloc({@required this.prayerTimeRepo})
      : assert(prayerTimeRepo != null);

  @override
  PrayerMonthState get initialState =>
      GetSelectedMonth(DateFormat('MMMM yyyy').format(DateTime.now()));

  @override
  Stream<PrayerMonthState> mapEventToState(PrayerMonthEvent event) async* {
    if (event is PreviousMonthState) {
      print("isPrevious BLoC");
      try {
        var lastSelectedMonth =
            DateFormat('MMMM yyyy').parse(event.lastSelectedMonth);

        yield GetSelectedMonth(DateFormat('MMMM yyyy').format(DateTime(
            lastSelectedMonth.year,
            lastSelectedMonth.month - 1,
            lastSelectedMonth.day)));
      } catch (e) {
        print(e);
      }
    }
    if (event is NextMonthState) {
      print("isNextMonth BLoC");
      try {
        var lastSelectedMonth =
        DateFormat('MMMM yyyy').parse(event.lastSelectedMonth);

        yield GetSelectedMonth(DateFormat('MMMM yyyy').format(DateTime(
            lastSelectedMonth.year,
            lastSelectedMonth.month + 1,
            lastSelectedMonth.day)));
      } catch (e) {
        print(e);
      }
    }
    if (event is CurrentMonthState) {
      print("isCurrentMonth BLoC");
      try {
        yield GetSelectedMonth(DateFormat('MMMM yyyy').format(DateTime.now()));
      } catch (e) {
        print(e);
      }
    }
  }
}
