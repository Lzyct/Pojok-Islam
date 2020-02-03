import 'package:flutter/material.dart';
import 'package:pojok_islam/resources/strings.dart';
import 'package:pojok_islam/utils/extensions.dart';

class Settings extends StatelessWidget {
  const Settings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: context.appBar(Strings.settings));
  }
}
