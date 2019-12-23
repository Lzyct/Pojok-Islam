import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pojok_islam/resources/colors.dart';
import 'package:pojok_islam/resources/dimens.dart';

extension ContextExtensions on BuildContext {
  double widthInPercent(BuildContext context, double percent) {
    var toDouble = percent / 100;
    return MediaQuery.of(context).size.width * toDouble;
  }

  double heightInPercent(BuildContext context, double percent) {
    var toDouble = percent / 100;
    return MediaQuery.of(context).size.height * toDouble;
  }

  void toastInfo(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.white,
        textColor: Palette.colorPrimary,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1);
  }

  void toastError(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.red[300],
        textColor: Colors.white,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1);
  }
}

extension WidgetExtensions on Widget {
  padding(EdgeInsets edgeInsets) => Padding(padding: edgeInsets, child: this);

  cardView(EdgeInsets margin, EdgeInsets padding) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(Dimens.Space16)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0, // has the effect of softening the shadow
            spreadRadius: 0.5, // has the effect of extending the shadow
            offset: Offset(
              0, // horizontal, move right 10
              0, // vertical, move down 10
            ),
          )
        ],
      ),
      child: this,
      margin: margin,
      padding: padding);

  marginVisible({EdgeInsets edgeInsets, bool isVisible = true}) => Visibility(
        visible: isVisible,
        child: Container(
            margin: (edgeInsets == null) ? EdgeInsets.all(0) : edgeInsets,
            child: this),
      );
}
