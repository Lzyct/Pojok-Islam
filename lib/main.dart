import 'package:flutter/material.dart';
import 'package:pojok_islam/resources/colors.dart';
import 'package:pojok_islam/ui/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Pallette.colorPrimary,
        primarySwatch: Pallette.colorPrimary,
        splashColor: Pallette.colorPrimary.withOpacity(0.2),
        splashFactory: InkRipple.splashFactory
      ),
      home: MainScreen(),
    );
  }
}


