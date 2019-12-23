import 'package:flutter/material.dart';
import 'package:pojok_islam/resources/dimens.dart';
import 'package:pojok_islam/utils/extensions.dart';

///*********************************************
/// Created by ukietux on 2019-12-20 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2019 | All Right Reserved
class OnBoardingItem extends StatelessWidget {
  final String title, subTitle, image;
  final Color textTitleColor, textSubTitleColor;

  OnBoardingItem(
      {this.title,
      this.subTitle,
      this.image,
      this.textTitleColor,
      this.textSubTitleColor});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
          fit: StackFit.expand,
          alignment: AlignmentDirectional.centerStart,
          children: <Widget>[
            Positioned(
              top: context.heightInPercent(context, 15),
              right: 0,
              child: Image(
                image: AssetImage(image),
              ),
            ),
            Positioned(
              left: context.widthInPercent(context, 2),
              bottom: context.heightInPercent(context, 15),
              child: Text(title,
                  style: TextStyle(
                      fontSize: Dimens.Display2,
                      color: textTitleColor,
                      fontWeight: FontWeight.bold)),
            ),
            Positioned(
              bottom: context.heightInPercent(context, 15),
              child: Opacity(
                opacity: 0.2,
                child: Text(title,
                    style: TextStyle(
                        fontSize: 60,
                        color: textTitleColor,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Positioned(
              left: context.widthInPercent(context, 2),
              bottom: context.heightInPercent(context, 13),
              child: Text(subTitle,
                  style: TextStyle(
                      fontSize: Dimens.Subheading2, color: textSubTitleColor)),
            ),
          ],
        ),
      ),
    ));
  }
}
