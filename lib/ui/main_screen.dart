import 'package:flutter/material.dart';
import 'package:pojok_islam/ui/home/home.dart';
import 'package:pojok_islam/ui/settings/settings.dart';
import 'dart:developer' as console;

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentTabIndex = 0;
  final List<Widget> _fragment = [Home(), Settings()];
  @override
  Widget build(BuildContext context) {
    console.log("piyu" + _currentTabIndex.toString());
    console.log("piyu" + _fragment.toString());
    // console.log("piyu"+_fragment[_currentTabIndex].toString());
    return Scaffold(
      body: _fragment[_currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentTabIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Beranda'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Pengaturan'),
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      console.log(index.toString());
      _currentTabIndex = index;
    });
  }
}
