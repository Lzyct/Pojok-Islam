import 'package:flutter/material.dart';
import 'package:pojok_islam/resources/colors.dart';
import 'package:pojok_islam/resources/dimens.dart';
import 'package:pojok_islam/resources/strings.dart';
import 'package:pojok_islam/utils/extensions.dart';
import 'package:shimmer/shimmer.dart';

///*********************************************
/// Created by ukietux on 2019-12-26 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2019 | All Right Reserved
class HomeTimeShalatLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        period: Duration(seconds: 3),
        enabled: true,
        child: SizedBox(
          width: context.widthInPercent(context, 90),
          height: context.heightInPercent(context, 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  width: context.widthInPercent(context, 40),
                  padding: EdgeInsets.all(Dimens.Space8),
                  decoration: new BoxDecoration(
                      color: Palette.colorPrimaryDark,
                      borderRadius: new BorderRadius.only(
                          bottomRight: const Radius.circular(Dimens.Space16))),
                  child: Column(
                    children: <Widget>[
                      Text(
                        Strings.empty,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Dimens.Body2,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "",
                        style: TextStyle(
                            fontSize: Dimens.Caption, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )),
              Container(
                color: Colors.black,
                margin: EdgeInsets.only(top: Dimens.Space4),
                width: context.widthInPercent(context, 80),
                height: context.heightInPercent(context, 8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
