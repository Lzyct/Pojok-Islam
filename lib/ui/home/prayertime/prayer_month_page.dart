import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pojok_islam/di/pref_manager.dart';
import 'package:pojok_islam/main.dart';
import 'package:pojok_islam/resources/colors.dart';
import 'package:pojok_islam/resources/dimens.dart';
import 'package:pojok_islam/resources/strings.dart';
import 'package:pojok_islam/ui/home/prayertime/bloc/prayer_month/prayer_month_bloc.dart';
import 'package:pojok_islam/utils/extensions.dart';

///*********************************************
/// Created by ukietux on 2020-01-31 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved,
class PrayerMonthPage extends StatelessWidget {
  const PrayerMonthPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PrayerMonthBloc>(context).add(CurrentMonthState());
    var selectedMonth = "test";
    return Scaffold(
      appBar: context.appBar(Strings.detailPrayer),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Text(
              getIt.get<PrefManager>().getLastLocation(),
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontSize: Dimens.Subheading1, color: Palette.colorPrimary),
            ).padding(EdgeInsets.all(Dimens.Space16)),
          ),
          BlocListener<PrayerMonthBloc, PrayerMonthState>(
              listener: (context, prayerMonth) {
                print("piyu");
                if (prayerMonth is GetSelectedMonth) {
                  print(
                      "isCurrentMonth listener : " + prayerMonth.selectedMonth);
                  selectedMonth = prayerMonth.selectedMonth;
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<PrayerMonthBloc>(context)
                          .add(PreviousMonthState(selectedMonth));
                    },
                    icon: Icon(
                      Icons.arrow_left,
                      color: Palette.colorPrimary,
                    ),
                  ),
                  BlocBuilder<PrayerMonthBloc,PrayerMonthState>(
                    builder: (context,prayerMonth){
                      if(prayerMonth is GetSelectedMonth){
                        return Text(selectedMonth,
                            style: TextStyle(
                                fontSize: Dimens.Subheading2,
                                color: Palette.colorPrimary));
                      }else return Container();
                    },
                  ),
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<PrayerMonthBloc>(context)
                          .add(NextMonthState(selectedMonth));
                    },
                    icon: Icon(
                      Icons.arrow_right,
                      color: Palette.colorPrimary,
                    ),
                  ),
                ],
              ).padding(
                  EdgeInsets.only(left: Dimens.Space16, right: Dimens.Space16)))
        ],
      ),
    );
  }
}
