import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pojok_islam/resources/colors.dart';

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
        textColor: Pallette.colorPrimary,
        gravity: ToastGravity.TOP,
        timeInSecForIos: 1);
  }

  void toastError(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.red[300],
        textColor: Colors.white,
        gravity: ToastGravity.TOP,
        timeInSecForIos: 1);
  }
}
