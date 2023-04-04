import 'dart:async';

import 'package:flutter/material.dart';
import 'package:dora_music/generated/assets.dart';
import 'package:get/get.dart';

import 'bottom_navigationWidget.dart';

class guidePage extends StatefulWidget {
  @override
  _guidePageState createState() => _guidePageState();
}

class _guidePageState extends State<guidePage> {
  int currentTime = 6;
  Timer ? timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        currentTime--;
      });
      if(currentTime <= 0){
        jumpHomePage();
      }
    });
  }
  void jumpHomePage(){
    timer!.cancel();
    Get.off(() => BottomNavigationWidget());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Assets.imagesSplashBg,
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            right: 10,
            child: GestureDetector(
              onTap: () {
                jumpHomePage();
              },
              child: _clipButton(),
            )
        )
      ],
    );
  }

  //  跳过按钮
  Widget _clipButton() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 50,
        height: 50,
        color: Colors.black.withOpacity(.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "跳过",
              style: TextStyle(fontSize: 12, color: Colors.white, decoration: TextDecoration.none),
            ),
            Text("${currentTime}s", style: TextStyle(fontSize: 12, color: Colors.white, decoration: TextDecoration.none))
          ],
        ),
      ),
    );
  }
}
