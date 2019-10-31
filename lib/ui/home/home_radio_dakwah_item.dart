import 'package:flutter/material.dart';
import 'package:pojok_islam/resources/colors.dart';
import 'package:pojok_islam/resources/dimens.dart';
import 'package:pojok_islam/resources/strings.dart';
import 'package:pojok_islam/utils/screen.dart';

class RadioDakwah extends StatelessWidget {
  const RadioDakwah({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(
              Dimens.space16, Dimens.space8, Dimens.space16, Dimens.space8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                Strings.radioDakwah,
                style: TextStyle(
                    color: Pallette.colorPrimary,
                    fontSize: Dimens.h3,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                Strings.seeAll,
                style: TextStyle(color: Pallette.colorPrimary),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: ScreenInPercent.heightInPercent(context, 14),
          margin: EdgeInsets.only(left: Dimens.space8, right: Dimens.space8),
          child: ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                    width: ScreenInPercent.widthInPercent(context, 50),
                    child: Card(
                        child: Container(
                      padding: EdgeInsets.all(Dimens.space16),
                      child: Text(
                          "test testtesttesttesttesttesttesttesttesttesttesttesttest"),
                    )));
              }),
        )
      ],
    );
  }
}
