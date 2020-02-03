import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:pojok_islam/di/pref_manager.dart';
import 'package:pojok_islam/main.dart';
import 'package:pojok_islam/resources/colors.dart';
import 'package:pojok_islam/resources/dimens.dart';
import 'package:pojok_islam/resources/strings.dart';
import 'package:pojok_islam/ui/home/bloc/location/location_bloc.dart';
import 'package:pojok_islam/ui/home/bloc/prayer_time/prayer_time_bloc.dart';
import 'package:pojok_islam/ui/home/prayertime/prayer_time_page.dart';
import 'package:pojok_islam/ui/home/widget/home_time_shalat_loading.dart';
import 'package:pojok_islam/ui/home/widget/home_widget.dart';
import 'package:pojok_islam/utils/extensions.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Logger().d("piyu " + getIt.get<PrefManager>().isFirstRun().toString());
    var curLocation = "";
    if (getIt.get<PrefManager>().isFirstRun())
      BlocProvider.of<LocationBloc>(context).add(GetLocationEvent());
    else
      curLocation = getIt.get<PrefManager>().getLastLocation();

    return BlocListener<LocationBloc, LocationState>(
      listener: (context, location) {
        if (location is GetLocationState) {
          getIt.get<PrefManager>().setLastLocation(location.locationValue);
          curLocation = getIt.get<PrefManager>().getLastLocation();
          getIt.get<PrefManager>().setIsFirstRun(false);
        }
      },
      child: BlocBuilder<LocationBloc, LocationState>(
          builder: (context, location) {
        //get prayer month
        if (location is GetLocationState) {

          var _location = curLocation.split(",");
          var params = Map<String, String>();
          params['kota'] = _location[0];
          params['negara'] = _location[1];
          params['method'] = '8';
          BlocProvider.of<PrayerTimeBloc>(context)
              .add(GetPrayerTodayEvent(params));
          Logger().d("debug : getPrayerMonth $params");

          return CustomScrollView(
            slivers: <Widget>[
              SliverPersistentHeader(
                delegate: HeaderView(
                    expandedHeight: context.heightInPercent(context, 38),
                    minHeight: context.widthInPercent(context, 35),
                    location: curLocation.toString()),
                pinned: true,
                floating: true,
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    margin: EdgeInsets.only(
                        top: context.heightInPercent(context, 14)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          child: Column(
                            children: <Widget>[
                              NearbyMosque(),
                              HaditsCollections(),
                              RadioDakwah(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
              )
            ],
          );
        } else {
          return Stack(
            children: <Widget>[
              FlareActor(
                "assets/flare/maps.flr",
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: "anim",
              ),
              Positioned(
                  bottom: context.heightInPercent(context, 30),
                  child: Container(
                    width: context.widthInPercent(context, 100),
                    child: Shimmer.fromColors(
                      baseColor: Palette.textPrimary,
                      highlightColor: Colors.grey[100],
                      period: Duration(seconds: 3),
                      enabled: true,
                      child: Text(
                        Strings.findLocation,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: Dimens.Title),
                      ),
                    ),
                  ))
            ],
          );
        }
      }),
    );
  }
}

class HeaderView extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double minHeight;
  final String location;

  HeaderView({@required this.expandedHeight, this.minHeight, this.location});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final cardTopPosition = expandedHeight / 1.35 - shrinkOffset;

    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Image(
          image: AssetImage('assets/images/bg_header.png'),
          fit: BoxFit.fill,
        ),
        SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        left: Dimens.Space16, top: Dimens.Space16),
                    child: Text(
                      "Pojok Islam",
                      style: TextStyle(
                          fontFamily: 'Arabic',
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Spacer(),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: Dimens.Space16),
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        new BoxShadow(
                            color: Colors.black12,
                            blurRadius: Dimens.Space2,
                            spreadRadius: Dimens.Elevation,
                            offset: Offset(0.0, Dimens.Space2)),
                      ],
                      borderRadius: new BorderRadius.only(
                        bottomLeft: const Radius.circular(Dimens.ButtonRound),
                        topLeft: const Radius.circular(Dimens.ButtonRound),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              BlocProvider.of<LocationBloc>(context)
                                  .add(GetLocationEvent());
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: Dimens.Space4,
                                  right: Dimens.Space4,
                                  top: Dimens.Space8,
                                  bottom: Dimens.Space8),
                              child: Flexible(
                                child: Row(
                                  children: <Widget>[
                                    Image(
                                      image: AssetImage(
                                          'assets/images/ic_location.png'),
                                      width: Dimens.SmallIcon,
                                      height: Dimens.SmallIcon,
                                      color: Palette.colorPrimary,
                                    ),
                                    Text(
                                      location,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: Dimens.Body1,
                                          color: Palette.colorPrimary),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                  )
                ],
              ),
              Visibility(
                  visible:
                      (1 - shrinkOffset / expandedHeight) <= 0.8 ? false : true,
                  child: Opacity(
                      opacity: (1 - ((shrinkOffset * 13) / expandedHeight)) <= 0
                          ? 0
                          : (1 - ((shrinkOffset * 13) / expandedHeight)),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                Dimens.Space16,
                                context.heightInPercent(context, 4),
                                Dimens.Space16,
                                0),
                            child: Text(
                              Strings.haditsText,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimens.Space16,
                                  fontStyle: FontStyle.italic),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(top: Dimens.Space2),
                            padding: EdgeInsets.fromLTRB(
                                0, Dimens.Space16, Dimens.SmallIcon, 0),
                            child: Text(
                              Strings.haditsRiwayah,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimens.Caption,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ))),
            ],
          ),
        ),
        Positioned(
          top: cardTopPosition > context.widthInPercent(context, 26)
              ? cardTopPosition
              : context.widthInPercent(context, 26),
          width: context.widthInPercent(context, 100),
          child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              margin:
                  EdgeInsets.only(left: Dimens.Space16, right: Dimens.Space16),
              child: Opacity(
                opacity: 1,
                child: BlocBuilder<PrayerTimeBloc, PrayerTimeState>(
                    builder: (context, prayerTime) {
                  if (prayerTime is PrayerLoadingState) {
                    Logger().d("initial");
                    return HomeTimeShalatLoading();
                  } else if (prayerTime is GetPrayerTodayState) {
                    var result = prayerTime.prayerTimeEntity;
                    var detailHijriah = result.detailHijriah.split(";");

                    return Card(
                      elevation: Dimens.Space4,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Row(
                            mainAxisSize : MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                  width: context.widthInPercent(context, 55),
                                  padding: EdgeInsets.all(Dimens.Space8),
                                  decoration: new BoxDecoration(
                                      gradient: context.gradientPrimary(),
                                      borderRadius: new BorderRadius.only(
                                          bottomRight: const Radius.circular(
                                              Dimens.Space16))),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "${detailHijriah[0]} ${detailHijriah[1]} ${detailHijriah[3]}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: Dimens.Body1,
                                            color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ).padding(EdgeInsets.only(
                                          bottom: (result.holidays == "[]")
                                              ? Dimens.Space4
                                              : 0)),
                                      Visibility(
                                        visible: (result.holidays == "[]")
                                            ? false
                                            : true,
                                        child: Text(
                                          "Puasa Ayyaumul Bid",
                                          style: TextStyle(
                                              fontSize: Dimens.Caption,
                                              color: Colors.white),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  )),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PrayerTimePage()));
                                },
                                child: Container(
                                  child: Text(
                                    Strings.seeAll,
                                    style: TextStyle(
                                        color: Palette.colorPrimary,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ).padding(EdgeInsets.only(
                                      top: Dimens.Space16, right: Dimens.Space16)),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: context.heightInPercent(context, 8),
                            child: TimeShalatAdapter(
                                prayerTime: result.waktuShalat),
                          ).padding(EdgeInsets.only(
                              top: Dimens.Space8, bottom: Dimens.Space16)),
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                }),
              )),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

class TimeShalat {
  final String shalatTime;
  final String shalatName;

  TimeShalat(this.shalatTime, this.shalatName);
}
