import 'package:flutter/widgets.dart';

class ScreenInPercent{

  static double widthInPercent(BuildContext context, double percent){
    var toDouble = percent/100;
    return MediaQuery.of(context).size.width * toDouble;
  }

  static double heightInPercent(BuildContext context, double percent){
    var toDouble = percent/100;
    return MediaQuery.of(context).size.height * toDouble;
  }
}