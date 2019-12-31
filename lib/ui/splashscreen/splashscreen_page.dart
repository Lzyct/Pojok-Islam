import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:pojok_islam/di/pref_manager.dart';
import 'package:pojok_islam/main.dart';
import 'package:pojok_islam/resources/colors.dart';
import 'package:pojok_islam/resources/dimens.dart';
import 'package:pojok_islam/ui/main_page.dart';
import 'package:pojok_islam/ui/onboarding/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

///*********************************************
/// Created by ukietux on 2019-12-18 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2019 | All Right Reserved
///
class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Palette.colorPrimary),
        child: Center(
          child: Text(
            "Pojok Islam",
            style: TextStyle(
                fontFamily: 'Arabic',
                color: Colors.white,
                fontSize: Dimens.Display3,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  _loadSettings() async {
    var initPrefManager = await SharedPreferences.getInstance();
    getIt.registerFactory<PrefManager>(() => PrefManager(initPrefManager));

    var prefManager = getIt.get<PrefManager>();
    prefManager.setCurrentMethod("8"); // TODO set default method is 8

    Future.delayed(Duration(seconds: 2), () {
      Logger().d("piyu $prefManager.isFirst()");
      if (!prefManager.isNotFirst()) {
        Route home = MaterialPageRoute(builder: (context) => OnBoardingPage());
        Navigator.pushReplacement(context, home);
      } else {
        Route home = MaterialPageRoute(builder: (context) => MainPage());
        Navigator.pushReplacement(context, home);
      }
    });
  }
}
