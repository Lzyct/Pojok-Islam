import 'package:flutter/material.dart';
import 'package:pojok_islam/resources/colors.dart';
import 'package:pojok_islam/resources/dimens.dart';

class TimeShalatWidget extends StatelessWidget {
  const TimeShalatWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      decoration: new BoxDecoration(
          color: Pallette.colorPrimary,
          borderRadius: new BorderRadius.only(
              bottomLeft: const Radius.circular(Dimens.space16),
              bottomRight: const Radius.circular(Dimens.space16),
              topLeft: const Radius.circular(Dimens.space16),
              topRight: const Radius.circular(Dimens.space16))),
      padding: EdgeInsets.fromLTRB(
          Dimens.space4, Dimens.space16, Dimens.space4, Dimens.space16),
      margin: EdgeInsets.fromLTRB(
          Dimens.space4, Dimens.space8, Dimens.space4, Dimens.space8),
      child: Column(children: <Widget>[
        Text("13:00",
            style: TextStyle(
              color: Colors.white,
              fontSize: Dimens.h4,
              fontWeight: FontWeight.bold,
            )),
        Text(
          "Subuh",
          style: TextStyle(
            color: Colors.white,
            fontSize: Dimens.h6,
          ),
        )
      ]),
    ));
  }
}
