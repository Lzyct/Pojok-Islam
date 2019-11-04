import 'package:flutter/widgets.dart';
import 'dart:developer' as Log;

extension DoubleExt on BuildContext {
  double widthInPercent(BuildContext context, double percent) {
    var toDouble = percent / 100;
    return MediaQuery.of(context).size.width * toDouble;
  }

  double heightInPercent(BuildContext context, double percent) {
    var toDouble = percent / 100;
    return MediaQuery.of(context).size.height * toDouble;
  }

  void log(String message) {
    Log.log(message);
  }
}
