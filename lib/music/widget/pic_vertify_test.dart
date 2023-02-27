import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hb_check_code/hb_check_code.dart';

class PicVertifyTest extends StatefulWidget {
  @override
  State<PicVertifyTest> createState() => _PicVertifyTestState();
}

class _PicVertifyTestState extends State<PicVertifyTest> {
  String code = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < 6; i++) {
      code = code + Random().nextInt(9).toString();
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        code = "";
        setState(() {
          for (var i = 0; i < 6; i++) {
            code+=Random().nextInt(9).toString();
          }
        });
      },
      child: Container(
          alignment: Alignment.center,
          child: HBCheckCode(
            code: code,
          )),
    );
  }
}
