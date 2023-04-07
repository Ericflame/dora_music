import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../generated/assets.dart';
import '../../../utils/eventbus/event_bus_handler.dart';
import '../../../utils/eventbus/event_object.dart';
import 'car_video_page.dart';
import 'movie_land_scape.dart';

class CarShortVideo extends StatefulWidget {
  final String url; //视频地址
  final String title; //视频标题
  final String nickName; //用户名称
  final String group; //关键字
  final String previewImageUrl; //预览图片的地址
  final bool showProgressBar; //是否显示进度条
  final bool showProgressText; //是否显示进度文本
  final int positionTag;
  final int shareCount;//分享数
  final int commentCount;//评论数
  final int praisedCount;//点赞数

  CarShortVideo({
    required this.url,
    required this.title,
    required this.nickName,
    this.group = "",
    this.previewImageUrl = "",
    this.showProgressBar = true,
    this.showProgressText = true,
    this.positionTag = 0,
    this.commentCount = 0,
    this.praisedCount = 0,
    this.shareCount = 0
  });

  @override
  _CarShortVideoState createState() => _CarShortVideoState();
}

class _CarShortVideoState extends State<CarShortVideo> {
  var _controller = VideoPlayerController.network("").obs;
  var _hideActionButton = true.obs; //是否隐藏播放按钮
  var videoPrepared = false.obs; //视频是否初始化
  var isOrientations = false.obs; //视频是否横屏
  double aspectRatio = 1; //比例
  late Future _initializeVideoPlayerFuture; //是否初始化

  @override
  void initState() {
    super.initState();
    _controller.value = VideoPlayerController.network(widget.url)
      ..setLooping(true).then((_) {
        if (widget.positionTag == 0 && CarVideoPage.firstInitTimes == 1) {
          CarVideoPage.firstInitTimes = 2;
          _controller.value.pause();
          videoPrepared.value = true;
          setState(() {});
        }
      });
    videoPrepared.value = true;
    _controller.value.pause();
    _initializeVideoPlayerFuture = _controller.value.initialize();
  }

  Future<bool> init() async {
    if (_controller.value.value.isPlaying) {
      await _controller.value.play().onError((error, stackTrace) {
        print("play error:{error.toString()}+{url}+");
      });
    } else {
      await _controller.value.pause().onError((error, stackTrace) {
        print("pause error:{error.toString()}+{url}+");
      });
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    aspectRatio = _controller.value.value.aspectRatio;
    return Obx(() {
      return Stack(
        children: <Widget>[
          Container(
            // color: Color(0XFF333333),
            color: Colors.black,
            child: GestureDetector(
              child: Stack(
                children: <Widget>[
                  Center(
                    child: AspectRatio(
                      aspectRatio: _controller.value.value.aspectRatio,
                      child: VideoPlayer(_controller.value, key: UniqueKey()),
                    ),
                  ),
                  _getPauseView(),
                  setPreferredOrientations(),
                ],
              ),
              onTap: () {
                if (_controller.value.value.isPlaying) {
                  _controller.value.pause();
                  _hideActionButton.value = false;
                  print("是否播放:" + _controller.value.value.isPlaying.toString());
                } else {
                  _controller.value.play();
                  videoPrepared.value = true;
                  _hideActionButton.value = true;
                  print("是否播放:" + _controller.value.value.isPlaying.toString());
                }
              },
            ),
          ),
          _getPreviewImage(), //预览图
          _getRightActionView(), //右侧转发，评论按钮
          _getLeftActionView(), //左侧文案
        ],
      );
    });
  }

  /// 预览图片
  Widget _getPreviewImage() {
    return Offstage(
      offstage: true,
      child: Container(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        color: Color(0XFF333333),
        child: Center(
          child: Image.asset(
            Assets.imagesSearchBg,
            fit: BoxFit.fill,
            width: ScreenUtil().screenWidth,
            // height: ScreenUtil.screenHeight,
          ),
        ),
      ),
    );
  }

  /// 播放按钮
  Widget _getPauseView() {
    return Offstage(
      offstage: _hideActionButton.value,
      child: Stack(
        children: <Widget>[
          Align(
            child: Container(
              height: 50.0,
              width: 50.0,
              child: Image.asset(
                Assets.imagesIconPlaying,
                color: Colors.grey,
              ),
            ),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }

  /// 分享、转发等功能按钮
  Widget _getRightActionView() {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 15, 80.0),
        child: Column(
          children: <Widget>[
            Container(
              child: Column(children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Fluttertoast.showToast(msg: "该功能暂未开放敬请期待！");
                  },
                  child: Image.asset(Assets.imagesIconLike, width: 25, height: 25),
                ),
                SizedBox(height: 3),
                Text(
                  "${widget.praisedCount}",
                  style: TextStyle(fontSize: 13, color: Colors.white, decoration: TextDecoration.none),
                ),
              ]),
            ),
            Container(
              margin: EdgeInsets.only(top: 25, bottom: 25),
              child: Column(children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Fluttertoast.showToast(msg: "该功能暂未开放敬请期待！");
                  },
                  child: Image.asset(Assets.imagesIconPinglun, width: 25, height: 25),
                ),
                SizedBox(height: 3),
                Text(
                  "${widget.commentCount}",
                  style: TextStyle(fontSize: 13, color: Colors.white, decoration: TextDecoration.none),
                ),
              ]),
            ),
            Container(
              child: Column(children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Fluttertoast.showToast(msg: "该功能暂未开放敬请期待！");
                  },
                  child: Image.asset(Assets.imagesIconZhuanfa, width: 25, height: 25),
                ),
                SizedBox(height: 3),
                Text(
                  "${widget.shareCount}",
                  style: TextStyle(fontSize: 13, color: Colors.white, decoration: TextDecoration.none),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  /// 底部文案
  Widget _getLeftActionView() {
    return Positioned(
      bottom: 0,
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 0),
        width: ScreenUtil().screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Text(
                "@" + widget.nickName ?? "",
                style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ]),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Text(
                    widget.title,
                    style: TextStyle(fontSize: 13, color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(5))),
                    margin: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      '查看详情',
                      style: TextStyle(fontSize: 12.0, color: Colors.black, decoration: TextDecoration.none),
                    ),
                  ),
                  onTap: () {},
                ),
                // SizedBox(
                //   width: 20,
                // ),
                // GestureDetector(
                //   child: Image.asset(Assets.imagesIconPraise, width: 21, height: 20),
                //   onTap: () {
                //     Fluttertoast.showToast(msg: "该功能暂未开放敬请期待！");
                //   },
                // ),
              ],
            ),
            Row(children: [
              Text(
                widget.group ?? "",
                style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              )
            ]),
          ],
        ),
      ),
    );
  }

  /// 横屏
  Widget setPreferredOrientations() {
    return Align(alignment: Alignment.bottomCenter,child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){
            /// 强制性全屏（无法隐藏底部导航栏）
            // if(isOrientations.value == false){
            //   // 强制横屏
            //   SystemChrome.setPreferredOrientations([
            //     DeviceOrientation.landscapeLeft,
            //     // DeviceOrientation.landscapeRight
            //   ]);
            //   isOrientations.value = true;
            // }else{
            //   // 强制竖屏
            //   SystemChrome.setPreferredOrientations([
            //     DeviceOrientation.portraitUp,
            //     // DeviceOrientation.portraitDown
            //   ]);
            //   isOrientations.value = false;
            // }
            /// 跳转到全屏页面
            Get.to(MovieBigLandScape(
                videoController:
                _controller.value));
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 100),
            padding: EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 4),
            decoration: BoxDecoration(
              //设置四周圆角 角度
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              //设置四周边框
              border: new Border.all(width: .1, color: Colors.white),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(Assets.imagesIconBigScreen,width: 14,height: 14),
                SizedBox(width: 5),
                Text("${isOrientations.value?"竖屏观看":"全屏观看"}", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold))
              ],
            ),
          ),
        )
      ],
    ))
      ;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.value.dispose(); //释放播放器资源
  }
}
