import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bottom_navigationWidget.dart';

class MenuContainer extends StatelessWidget {
  Widget child;
  String title;
  String? rightBtnStr;
  String? rightBtnStr2;
  Function? rightBtnClick;
  Function? rightBtnClick2;
  bool showLogo = true;
  bool showBack = true;
  bool showTriangle = true;
  bool gradientBg = true;
  double paddingTop = 40;

  MenuContainer(
      {required this.child,
      required this.title,
      this.rightBtnStr,
      this.rightBtnStr2,
      this.rightBtnClick,
      this.rightBtnClick2,
      this.gradientBg = true,
      this.showLogo = true,
      this.showTriangle = true,
      this.showBack = true,
      this.paddingTop = 40});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          if (showLogo)
            Positioned(
              child: Image.asset(
                "assets/images/返回.png",
                width: 50,
                height: 50,
              ),
              right: 10,
            ),
          Column(
            children: [
              Row(
                  children: [
                    Expanded(
                      child: Text(
                        "$title",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              Expanded(child: child)
            ],
          ),
        ],
      ),
    );
  }
}
