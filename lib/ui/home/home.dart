import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pojok_islam/resources/colors.dart';
import 'package:pojok_islam/resources/dimens.dart';
import 'package:pojok_islam/resources/strings.dart';
import 'package:pojok_islam/ui/home/time_shalat.dart';
import 'package:pojok_islam/utils/screen.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          child: Stack(children: <Widget>[
        Container(
          width: ScreenInPercent.widthInPercent(context, 100),
          height: ScreenInPercent.heightInPercent(context, 30),
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
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(
                            Dimens.space8, Dimens.space16, Dimens.space8, 0),
                        child: Image(
                          image: AssetImage('assets/images/ic_location.png'),
                          width: Dimens.smallIcon,
                          height: Dimens.smallIcon,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, Dimens.space16, 0, 0),
                        child: Text(
                          "Makassar,Indonesia",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: Dimens.h4, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        0, Dimens.space16, Dimens.space16, 0),
                    child: Image(
                      image: AssetImage('assets/images/ic_settings.png'),
                      width: Dimens.smallIcon,
                      height: Dimens.smallIcon,
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
                          Dimens.space16, 30, Dimens.space16, 0),
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
                      width: ScreenInPercent.widthInPercent(context, 85),
                      height: ScreenInPercent.heightInPercent(context, 16),
                      margin: EdgeInsets.fromLTRB(
                          0, Dimens.space16, 0, Dimens.space16),
                      child: Card(
                          elevation: 4,
                          child: Column(
                            children: <Widget>[
                              Container(
                                width:
                                    ScreenInPercent.widthInPercent(context, 40),
                                padding: EdgeInsets.all(Dimens.space8),
                                decoration: new BoxDecoration(
                                    color: Pallette.colorPrimary,
                                    borderRadius: new BorderRadius.only(
                                        bottomLeft: const Radius.circular(
                                            Dimens.space16),
                                        bottomRight: const Radius.circular(
                                            Dimens.space16))),
                                child: Text(
                                  "10 Syawal 1440H",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: Dimens.h5,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  TimeShalatWidget(),
                                  TimeShalatWidget(),
                                  TimeShalatWidget(),
                                  TimeShalatWidget(),
                                  TimeShalatWidget(),
                                  TimeShalatWidget(),
                                ],
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