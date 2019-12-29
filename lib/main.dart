import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pojok_islam/di/app.dart';
import 'package:pojok_islam/resources/colors.dart';
import 'package:pojok_islam/ui/splashscreen/splashscreen_page.dart';

GetIt getIt = GetIt.instance;

void main() {
  setupLocator();
  runApp(MyApp());
}

//setup DI
void setupLocator() {
  getIt.registerFactory<App>(() => App(Dio()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pojok Islam',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Palette.colorPrimary,
          primarySwatch: Palette.colorPrimary,
          splashColor: Palette.colorPrimary.withOpacity(0.2),
          splashFactory: InkRipple.splashFactory),
      home: SplashScreenPage(),
    );
  }
}
