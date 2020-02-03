import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:pojok_islam/data/repository/prayer_time_repo.dart';
import 'package:pojok_islam/data/source/local/prayer_time_db.dart';
import 'package:pojok_islam/data/source/rest/pojok_islam_client.dart';
import 'package:pojok_islam/resources/colors.dart';
import 'package:pojok_islam/ui/home/bloc/location/location_bloc.dart';
import 'package:pojok_islam/ui/home/bloc/prayer_time/prayer_time_bloc.dart';
import 'package:pojok_islam/ui/home/home_page.dart';
import 'package:pojok_islam/ui/settings/settings_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentTabIndex = 0;
  final PageStorageBucket bucket = PageStorageBucket();

  final List<Widget> _fragment = [
    MultiBlocProvider(
      providers: [
        BlocProvider<LocationBloc>(create: (context) => LocationBloc()),
        BlocProvider<PrayerTimeBloc>(
            create: (context) => PrayerTimeBloc(
                  prayerTimeRepo: PrayerTimeRepo(
                      pojokIslamClient: PojokIslamClient(),
                      prayerTimeDb: PrayerTimeDb()),
                ))
      ],
      child: HomePage(
        key: PageStorageKey("pageHome"),
      ),
    ),
    Settings(key: PageStorageKey("pageSettings"))
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageStorage(
        child: _fragment[_currentTabIndex],
        bucket: bucket,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (int index) => setState(() => _currentTabIndex = index),
        currentIndex: _currentTabIndex,
        items: [
          BottomNavigationBarItem(
            icon: new ImageIcon(
              AssetImage('assets/images/ic_home.png'),
              color: _currentTabIndex == 0 ? Palette.colorPrimary : Colors.grey,
            ),
            title: new Text(
              'Beranda',
              style: TextStyle(
                color:
                    _currentTabIndex == 0 ? Palette.colorPrimary : Colors.grey,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: new ImageIcon(
              AssetImage('assets/images/ic_settings.png'),
              color: _currentTabIndex == 1 ? Palette.colorPrimary : Colors.grey,
            ),
            title: new Text(
              'Pengaturan',
              style: TextStyle(
                color:
                    _currentTabIndex == 1 ? Palette.colorPrimary : Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }
}
