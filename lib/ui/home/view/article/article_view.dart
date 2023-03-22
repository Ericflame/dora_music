import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';
import 'hand_paint_board.dart';
import 'article_logic.dart';

///文章
class ArticlePage extends StatefulWidget {
  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  final logic = Get.put(ArticleLogic());
  bool landScape = false;
  SignatureController signatureController = SignatureController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        color: Colors.white,
        child: FittedBox(
          fit: BoxFit.contain,
          child: DrawView(
            signatureController: signatureController,
            width: 690,
            height: 370,
            landScape: landScape,
            biggerCallback: () {
              setState(() {
                landScape = !landScape;
              });
            },
            resetCallback: () {
              setState(() {
                landScape = false;
              });
            },
          ),
        ),
      ),
    );
  }
}
