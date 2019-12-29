import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:pojok_islam/resources/colors.dart';
import 'package:pojok_islam/resources/dimens.dart';
import 'package:pojok_islam/ui/main_page.dart';
import 'package:pojok_islam/ui/onboarding/widget/onboarding_item.dart';
import 'package:pojok_islam/utils/pref_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

///*********************************************
/// Created by ukietux on 2019-12-19 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2019 | All Right Reserved
class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentPageValue = 0;
  int previousPageValue = 0;
  PageController controller;
  double _moveBar = 0.0;
  PrefManager _prefManager;

  final List<Widget> introWidgetsList = <Widget>[
    OnBoardingItem(
      title: "Masjid Terdekat",
      subTitle: "Menampilkan waktu shalat dan masjid terdekat",
      image: 'assets/images/ic_step_1.png',
      textTitleColor: Color(0xff00ab95),
      textSubTitleColor: Color(0xff01cdb4),
    ),
    OnBoardingItem(
      title: "Hadits Harian",
      subTitle: "Menampilkan hadits harian dan pilihan",
      image: 'assets/images/ic_step_2.png',
      textTitleColor: Color(0xff083863),
      textSubTitleColor: Color(0xc1083863),
    ),
    OnBoardingItem(
      title: "Radio Dakwah",
      subTitle: "Menampilkan daftar radio dakwah",
      image: 'assets/images/ic_step_3.png',
      textTitleColor: Palette.colorPrimary,
      textSubTitleColor: Color(0xff6644BF),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Colors.white),
        child: SafeArea(
          child: Scaffold(
            body: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: <Widget>[
                PageView.builder(
                  physics: ClampingScrollPhysics(),
                  itemCount: introWidgetsList.length,
                  onPageChanged: (int page) {
                    getChangedPageAndMoveBar(page);
                  },
                  controller: controller,
                  itemBuilder: (context, index) {
                    return introWidgetsList[index];
                  },
                ),
                Positioned(
                  bottom: 0,
                  left: Dimens.Space16,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 35),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (int i = 0; i < introWidgetsList.length; i++)
                          if (i == currentPageValue)
                            circleBar(true, currentPageValue)
                          else
                            circleBar(false, currentPageValue),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButton: Visibility(
              visible: currentPageValue == introWidgetsList.length - 1
                  ? true
                  : false,
              child: FloatingActionButton(
                backgroundColor: Palette.colorPrimary,
                onPressed: () {
                  _prefManager.setIsNotFirst(true);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MainPage()));
                },
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(26))),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ));
  }

  Widget circleBar(bool _isActive, int _page) {
    Color _selectedColor;
    if (_page == 0) {
      _selectedColor = Color(0xff00ab95);
    } else if (_page == 1) {
      _selectedColor = Color(0xff083863);
    } else if (_page == 2) {
      _selectedColor = Palette.colorPrimary;
    }
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: _isActive ? Dimens.Space16 : Dimens.Space8,
      width: _isActive ? Dimens.Space16 : Dimens.Space8,
      decoration: BoxDecoration(
          color: _isActive ? _selectedColor : Colors.black26,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }

  void getChangedPageAndMoveBar(int page) {
    Logger().d('page is $page');

    if (previousPageValue == 0) {
      previousPageValue = page;
      _moveBar = _moveBar + 0.14;
    } else {
      if (previousPageValue < page) {
        previousPageValue = page;
        _moveBar = _moveBar + 0.14;
      } else {
        previousPageValue = page;
        _moveBar = _moveBar - 0.14;
      }
    }
    setState(() {
      currentPageValue = page;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  _loadSettings() async {
    _prefManager = PrefManager(await SharedPreferences.getInstance());
  }
}
