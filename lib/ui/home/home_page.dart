import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pojok_islam/resources/colors.dart';
import 'package:pojok_islam/resources/dimens.dart';
import 'package:pojok_islam/resources/strings.dart';
import 'package:pojok_islam/ui/home/time_shalat_item.dart';
import 'package:pojok_islam/utils/screen.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(children: <Widget>[
      Container(
        width: ScreenInPercent.widthInPercent(context, 100),
        height: ScreenInPercent.heightInPercent(context, 38),
        child: Image(
          image: AssetImage('assets/images/bg_header.png'),
          fit: BoxFit.cover,
        ),
      ),
      SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                      left: Dimens.space16, top: Dimens.space16),
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
                  margin: EdgeInsets.only(top: Dimens.space16),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      new BoxShadow(
                          color: Colors.black12,
                          blurRadius: Dimens.space2,
                          spreadRadius: Dimens.elevation,
                          offset: Offset(0.0, Dimens.space2)),
                    ],
                    borderRadius: new BorderRadius.only(
                      bottomLeft: const Radius.circular(Dimens.buttonRound),
                      topLeft: const Radius.circular(Dimens.buttonRound),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(
                              left: Dimens.space4,
                              right: Dimens.space4,
                              top: Dimens.space8,
                              bottom: Dimens.space8),
                          child: Row(
                            children: <Widget>[
                              Image(
                                image:
                                    AssetImage('assets/images/ic_location.png'),
                                width: Dimens.smallIcon,
                                height: Dimens.smallIcon,
                                color: Pallette.colorPrimary,
                              ),
                              Text(
                                "Makassar,Indonesia",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: Dimens.h4,
                                    color: Pallette.colorPrimary),
                              ),
                            ],
                          )),
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Flexible(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(
                        Dimens.space16, 40, Dimens.space16, 0),
                    child: Text(
                      Strings.haditsText,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Dimens.space16,
                          fontStyle: FontStyle.italic),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: Dimens.space8),
                  padding: EdgeInsets.fromLTRB(
                      0, Dimens.space16, Dimens.smallIcon, 0),
                  child: Text(
                    Strings.haditsRiwayah,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: Dimens.h5,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.end,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Flexible(
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(Dimens.space16, Dimens.space24,
                        Dimens.space16, Dimens.space16),
                    child: Card(
                        elevation: 4,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                                width:
                                    ScreenInPercent.widthInPercent(context, 40),
                                padding: EdgeInsets.all(Dimens.space8),
                                decoration: new BoxDecoration(
                                    color: Pallette.colorPrimaryDark,
                                    borderRadius: new BorderRadius.only(
                                        bottomLeft: const Radius.circular(
                                            Dimens.space16),
                                        bottomRight: const Radius.circular(
                                            Dimens.space16))),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "13 Syawal 1440H",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: Dimens.h4,
                                          color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      "Puasa Ayyaumul Bid",
                                      style: TextStyle(
                                          fontSize: Dimens.h6,
                                          color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )),
                            Flexible(
                                child: Container(
                              width: double.infinity,
                              height:
                                  ScreenInPercent.heightInPercent(context, 8.5),
                              margin: EdgeInsets.only(
                                  left: Dimens.space8,
                                  right: Dimens.space8,
                                  top: Dimens.space8),
                              child: TimeShalatAdapter(),
                            )),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(Dimens.space8),
                              child: Text(
                                "Lihat Semua",
                                style: TextStyle(
                                    color: Pallette.colorPrimary,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.end,
                              ),
                            )
                          ],
                        )),
                  ),
                )
              ],
            )
          ],
        ),
      )
    ]));
  }
}

class TimeShalat {
  final String shalatTime;
  final String shalatName;
  TimeShalat(this.shalatTime, this.shalatName);
}
