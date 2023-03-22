/// File Name: hand_paint_board
/// Project Name: flutter_test
/// Created By Hongzhang Chen On 2023-03-21
/// Copy Right ©2023-03-21 flutter_test All Right Reserved
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced/generated/assets.dart';
import 'package:signature/signature.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawView extends StatefulWidget {
  final signatureController;
  final biggerCallback; // 放大回调
  final resetCallback; // 还原大小回调
  final double width;
  final double height;
  final bool landScape; // 是否横屏
  DrawView(
      {
        this.signatureController,
        this.biggerCallback,
        this.resetCallback,
        required this.width,
        required this.height,
        required this.landScape})
      : super();

  @override
  _DrawViewState createState() => _DrawViewState();
}

class _DrawViewState extends State<DrawView> {
  bool isEmpty = false;

  @override
  void initState() {
    super.initState();

    if (widget.signatureController.value.length > 0) {
      isEmpty = false;
    } else {
      isEmpty = true;
    }

    // 监听画板
    widget.signatureController.addListener(() {
      bool tmpIsEmpty = true;
      if (widget.signatureController.value.length > 0) {
        tmpIsEmpty = false;
      } else {
        tmpIsEmpty = true;
      }
      if (isEmpty != tmpIsEmpty) {
        if (this.mounted) {
          setState(() {
            isEmpty = tmpIsEmpty;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: widget.landScape ? 1 : 0,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Signature(
            controller: widget.signatureController,
            width: widget.width,
            height: widget.height,
            backgroundColor: Colors.white,
          ),
          // 暂无签名
          Offstage(
            offstage: isEmpty ? false : true,
            child: Text(
              '签名（必填）',
              style: TextStyle(
                fontSize: 44.sp,
                color: Color(0xffA5ACB4),
              ),
            ),
          ),
          // 放大按钮
          Positioned(
            top: 10,
            right: widget.landScape ? 0 : 10,
            child: IconButton(
              icon: Image.asset(
                Assets.imagesIconBigger,
                width: 35,
                height: 35,
              ),
              onPressed: () {
                widget.biggerCallback();
              },
            ),
          ),
          // 橡皮 & 完成 按钮
          Positioned(
            bottom: 10,
            right: widget.landScape ? 0 : 10,
            child: Row(
              children: [
                // 橡皮
                IconButton(
                  icon: Image.asset(
                    Assets.imagesIconEraser,
                    width: 35,
                    height: 35,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.signatureController.clear();
                    });
                  },
                ),
                // 完成
                Offstage(
                  offstage: widget.landScape ? true : false,
                  child: Container(
                    width: 80,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffb1dbf4),
                    ),
                    child: TextButton(
                      child: Text(
                        '完成',
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        widget.resetCallback();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}