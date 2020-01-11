import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:pojok_islam/di/api.dart';
import 'package:pojok_islam/di/db_helper.dart';
import 'package:pojok_islam/resources/colors.dart';
import 'package:pojok_islam/ui/splashscreen/splashscreen_page.dart';

GetIt getIt = GetIt.instance;

main() {
  setupLocator();
  runApp(MyApp());
}

//setup DI
setupLocator() async {
  getIt.registerFactory<API>(() => API(Dio()));
  getIt.registerFactory<DbHelper>(() => DbHelper());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    //set transparent statusbar on android
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));

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
