import 'package:flutter/material.dart';

import 'keep_alive_wrapper.dart';

/// File Name: page_view_demo
/// Project Name: flutter_lib
/// Created By Hongzhang Chen On 2023-03-24
/// Copy Right ©2023-03-24 flutter_lib All Right Reserved

class ViewPage extends StatefulWidget {
  PageController pageController;
  double currPageValue;
  double scaleFactor; //缩放系数
  double height;
  List<Widget> widgets = [];

  ViewPage(
      {required this.widgets,
      this.height = 230.0,
      this.scaleFactor = 0.8,
      this.currPageValue = 0.0,
      required this.pageController});
  @override
  State<StatefulWidget> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  void initState() {
    super.initState();
    widget.pageController = PageController(viewportFraction: 0.9);
    widget.pageController.addListener(() {
      setState(() {
        widget.currPageValue = widget.pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height,
        child: PageView.builder(
          itemBuilder: (context, index) =>
              KeepAliveWrapper(keepAlive: true, child: _buildPageItem(index, widget.widgets)),
          itemCount: widget.widgets.length,
          controller: widget.pageController,
          scrollDirection: Axis.vertical,
        ));
  }

  _buildPageItem(int index, List<Widget> widgets) {
    Matrix4 matrix4 = Matrix4.identity();
    if (index == widget.currPageValue.floor()) {
      //当前的item
      var currScale = 1 - (widget.currPageValue - index) * (1 - widget.scaleFactor);
      var currTrans = widget.height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0)..setTranslationRaw(0.0, currTrans, 0.0);
    } else if (index == widget.currPageValue.floor() + 1) {
      //右边的item
      var currScale = widget.scaleFactor + (widget.currPageValue - index + 1) * (1 - widget.scaleFactor);
      var currTrans = widget.height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0)..setTranslationRaw(0.0, currTrans, 0.0);
    } else if (index == widget.currPageValue.floor() - 1) {
      //左边
      var currScale = 1 - (widget.currPageValue - index) * (1 - widget.scaleFactor);
      var currTrans = widget.height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0)..setTranslationRaw(0.0, currTrans, 0.0);
    } else {
      //其他，不在屏幕显示的item
      matrix4 = Matrix4.diagonal3Values(1.0, widget.scaleFactor, 1.0)
        ..setTranslationRaw(0.0, widget.height * (1 - widget.scaleFactor) / 2, 0.0);
    }

    return Transform(
        transform: matrix4,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical:10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              // image: DecorationImage(
              //   image: AssetImage(Assets.imagesBgCommonAlertDialog),
              //   fit: BoxFit.cover,
              // ),
            ),
            child: Stack(
              children: [widgets[index], Center(
                child: Text("$index"),
              )],
            ),
          ),
        ));
  }
}
