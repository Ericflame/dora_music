import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced/ui/music/widget/slide_vertify_test.dart';
import 'package:get/get.dart';
import 'package:hb_check_code/hb_check_code.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'music_logic.dart';

///滑块验证码
class MusicPage extends StatefulWidget {
  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  final logic = Get.put(MusicLogic());
  TextEditingController searchController = TextEditingController();
  bool showPic = false;
  String hint = "";
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
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Center(
            child: SlideVerifyWidget(
                backgroundColor: Color(0xffe8e8e8),
                slideColor: Color(0xff7ac336),
                borderColor: Colors.white,
                verifySuccessListener: () {
                  showDialog(
                      context: context,
                      barrierDismissible: true,
                      useRootNavigator: true,
                      builder: (context) {
                        return StatefulBuilder(builder: (context, state) {
                          return Scaffold(
                            backgroundColor: Color(0x1E000000), //设置为透明色
                            body: new WillPopScope(
                                child: GestureDetector(
                                  onTap: () {
                                    FocusScope.of(context).requestFocus(FocusNode());
                                  },
                                  child: Center(
                                    child: Container(
                                      decoration:
                                          BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                                      width: 300,
                                      // padding: EdgeInsets.only(bottom: 20),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: 25, bottom: 20, left: 15, right: 15),
                                            padding: EdgeInsets.only(top: 2, bottom: 2),
                                            height: 40,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                    child: TextField(
                                                  style: TextStyle(fontSize: 13),
                                                  textInputAction: TextInputAction.search,
                                                  controller: searchController,
                                                  autofocus: false,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(6), //限制长度
                                                    FilteringTextInputFormatter.allow(RegExp("[0-9]")), //数字包括小数
                                                  ],
                                                  decoration: InputDecoration(
                                                    hintStyle: TextStyle(fontSize: 13),
                                                    border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(0)),
                                                        borderSide: BorderSide.none),
                                                    filled: true,
                                                    fillColor: Color(0xFFe6f4fd),
                                                    hintText: "请输入验证码",
                                                    // isCollapsed: true,
                                                    contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 15),
                                                    // prefixIcon: Icon(
                                                    //   Icons.search,
                                                    //   size: 20,
                                                    // )
                                                  ),
                                                  onSubmitted: (value) {
                                                    state(() {
                                                      if (searchController.text == code) {
                                                        hint = "验证码识别成功";
                                                        showPic = true;
                                                      } else {
                                                        hint = "验证码错误";
                                                        code = "";
                                                        for (var i = 0; i < 6; i++) {
                                                          code += Random().nextInt(9).toString();
                                                        }
                                                      }
                                                    });
                                                  },
                                                )),
                                              ],
                                            ),
                                          ),
                                          Offstage(
                                              offstage: showPic,
                                              child: GestureDetector(
                                                onTap: () {
                                                  state(() {
                                                    code = "";
                                                    for (var i = 0; i < 6; i++) {
                                                      code += Random().nextInt(9).toString();
                                                    }
                                                  });
                                                },
                                                child: Container(
                                                    color: Color(0xfff5f5f5),
                                                    margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                                                    alignment: Alignment.center,
                                                    child: HBCheckCode(
                                                      code: code,
                                                    )),
                                              )),
                                          Text(
                                            hint,
                                            style: TextStyle(color: Colors.red),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                state(() {
                                                  if (searchController.text == code) {
                                                    showPic = true;
                                                    Fluttertoast.showToast(msg: "验证成功");
                                                    Get.back();
                                                  } else {
                                                    hint = "验证码错误";
                                                    code = "";
                                                    for (var i = 0; i < 6; i++) {
                                                      code += Random().nextInt(9).toString();
                                                    }
                                                  }
                                                });
                                              },
                                              child: Text("确认"),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                onWillPop: () async => true),
                          );
                        });
                      });
                }),
          ),
        ],
      ),
    );
  }
}
