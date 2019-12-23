import 'package:flutter/material.dart';
import 'package:pojok_islam/resources/colors.dart';

class Settings extends StatelessWidget {
  const Settings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pengaturan"),
        backgroundColor: Palette.colorPrimary,
      ),
    );
  }
}
