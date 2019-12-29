import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pojok_islam/data/models/models.dart';
import 'package:pojok_islam/data/models/response/response_prayer_today.dart';
import 'package:pojok_islam/data/repository/prayer_time_repo.dart';

part 'prayer_time_event.dart';
part 'prayer_time_state.dart';

class PrayerTimeBloc extends Bloc<PrayerTimeEvent, PrayerTimeState> {
  final PrayerTimeRepo prayerTimeRepo;

  PrayerTimeBloc({@required this.prayerTimeRepo})
      : assert(prayerTimeRepo != null);

  @override
  PrayerTimeState get initialState => LoadingState();

  @override
  Stream<PrayerTimeState> mapEventToState(PrayerTimeEvent event) async* {
    if (event is GetPrayerMonthEvent) {
      yield LoadingState();
      var _response = await prayerTimeRepo.getPrayerMonth(event._params);
      yield GetPrayerMonthState(_response);
    } else if (event is GetPrayerTodayEvent) {
      yield LoadingState();
      var _response = await prayerTimeRepo.getPrayerToday(event._params);
      yield GetPrayerTodayState(_response);
    }
  }
}
