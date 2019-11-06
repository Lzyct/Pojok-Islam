import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pojok_islam/resources/colors.dart';
import 'package:pojok_islam/ui/home/bloc/bloc.dart';
import 'package:pojok_islam/ui/home/home_page.dart';
import 'package:pojok_islam/ui/settings/settings_page.dart';
import 'dart:developer' as console;
import 'package:flutter/services.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentTabIndex = 0;
  final List<Widget> _fragment = [
    
    BlocProvider<HomeBloc>(
        builder:  (context)=> HomeBloc(),
        child: Home()), Settings()];
  @override
  Widget build(BuildContext context) {
    //set transparent statusbar on android
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Scaffold(
      body: _fragment[_currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentTabIndex,
        items: [
          BottomNavigationBarItem(
            icon: new ImageIcon(
              AssetImage('assets/images/ic_home.png'),
              color:
                  _currentTabIndex == 0 ? Pallette.colorPrimary : Colors.grey,
            ),
            title: new Text(
              'Beranda',
              style: TextStyle(
                color:
                    _currentTabIndex == 0 ? Pallette.colorPrimary : Colors.grey,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: new ImageIcon(
              AssetImage('assets/images/ic_settings.png'),
              color:
                  _currentTabIndex == 1 ? Pallette.colorPrimary : Colors.grey,
            ),
            title: new Text(
              'Pengaturan',
              style: TextStyle(
                color:
                    _currentTabIndex == 1 ? Pallette.colorPrimary : Colors.grey,
              ),
            ),
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
