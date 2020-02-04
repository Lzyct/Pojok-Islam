import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:pojok_islam/data/models/entity/prayer_time_entity.dart';
import 'package:pojok_islam/data/repository/prayer_time_repo.dart';

part 'prayer_time_event.dart';
part 'prayer_time_state.dart';

class PrayerTimeBloc extends Bloc<PrayerTimeEvent, PrayerTimeState> {
  final PrayerTimeRepo prayerTimeRepo;
  PrayerTimeBloc({@required this.prayerTimeRepo})
      : assert(prayerTimeRepo != null);

  @override
  PrayerTimeState get initialState => PrayerLoadingState();

  @override
  Stream<PrayerTimeState> mapEventToState(PrayerTimeEvent event) async* {
    if (event is GetPrayerMonthEvent) {
      try {
        yield PrayerLoadingState();
        var _response = await prayerTimeRepo.getPrayerMonth(event._params,event._dateTime);
        yield GetPrayerMonthState(_response);
      } catch (e) {
        Logger().e(e);
      }
    }
    if (event is GetPrayerTodayEvent) {
      try {
        yield PrayerLoadingState();
        var _response = await prayerTimeRepo.getPrayerToday(event._params,event._dateTime);
        yield GetPrayerTodayState(_response);
      } catch (e) {
        Logger().e(e);
      }
    }
  }
}
