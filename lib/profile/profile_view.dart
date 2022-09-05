import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';
import 'profile_logic.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final logic = Get.put(ProfileLogic());
  late WebViewController _webViewController;
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    // if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
            onPressed: () {
              // Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        // centerTitle: true,
        elevation: 0.5,
        toolbarHeight: 45,
        title: Text("客户详情", style: TextStyle(fontSize: 14)),
      ),
      body: Container(
        child: WebView(
          initialUrl: 'https://flutter.cn',
        ),
      ),
    );
  }


}
