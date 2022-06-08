import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';

class PickerDateTimeType {
  static const int kMDY = 0; // m, d, y
  static const int kHM = 1; // hh, mm
  static const int kHMS = 2; // hh, mm, ss
  static const int kHM_AP = 3; // hh, mm, ap(AM/PM)
  static const int kMDYHM = 4; // m, d, y, hh, mm
  static const int kMDYHM_AP = 5; // m, d, y, hh, mm, AM/PM
  static const int kMDYHMS = 6; // m, d, y, hh, mm, ss

  static const int kYMD = 7; // y, m, d
  static const int kYMDHM = 8; // y, m, d, hh, mm
  static const int kYMDHMS = 9; // y, m, d, hh, mm, ss
  static const int kYMD_AP_HM = 10; // y, m, d, ap, hh, mm

  static const int kYM = 11; // y, m
  static const int kDMY = 12; // d, m, y
  static const int kY = 13; // y
}

showSingleChoose(BuildContext context, List<String> list, Function callBack,
    {String cancelText = "取消", Function? cacelCallBack}) {
  Picker picker = new Picker(
      adapter: PickerDataAdapter<String>(pickerdata: list),
      changeToFirst: true,
      textAlign: TextAlign.left,
      height: 160,
      columnFlex: [1, 1, 1, 1, 1, 1, 1, 1],
      selectionOverlay: Container(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                width: 90,
                height: 1.5,
                color: Color(0xff5385F1),
              )
            ],
          )),
      cancelText: cancelText,
      selectedTextStyle: TextStyle(fontSize: 12, color: Color(0xff5385F1)),
      textStyle: TextStyle(fontSize: 12, color: Color(0xff333333)),
      cancelTextStyle: TextStyle(
        fontSize: 12,
        color: Color(0xff999999),
      ),
      confirmText: "确定",
      confirmTextStyle: TextStyle(
        fontSize: 12,
        color: Color(0xff5385F1),
      ),
      headerDecoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.transparent, width: 0.5))),
      columnPadding: const EdgeInsets.all(8.0),
      onCancel: () {
        if (cacelCallBack != null) cacelCallBack();
      },
      onConfirm: (Picker picker, List value) {
        callBack(value[0]);
      });
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Material(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: Container(
              padding: const EdgeInsets.only(top: 4),
              child: picker.makePicker(null, true),
            ));
      });
}
