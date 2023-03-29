import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:video_player/video_player.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:event_bus/event_bus.dart';
import '../../../generated/assets.dart';
import 'car_video_page.dart';

class CarShortVideo extends StatefulWidget {
  final String url;//视频地址
  final String title;//视频标题
  final String previewImageUrl; //预览图片的地址
  final bool showProgressBar; //是否显示进度条
  final bool showProgressText; //是否显示进度文本
  final int positionTag;


  CarShortVideo(
      {
        required this.url,
        required this.title,
        this.previewImageUrl= "",
        this.showProgressBar= true,
        this.showProgressText= true,
        this.positionTag = 0,
      });

  @override
  _CarShortVideoState createState() => _CarShortVideoState();
}

class _CarShortVideoState extends State<CarShortVideo> {
  late VideoPlayerController _controller;
  bool _hideActionButton = true;//是否隐藏视频
  bool videoPrepared = false; //视频是否初始化
  double aspectRatio = 1;//比例
  late Future _initializeVideoPlayerFuture;//是否初始化
  @override
  void initState() {
    super.initState();
    print("哈哈"+widget.url);
    // _controller.play();
    // videoPrepared = true;
    // eventBus.on(EventVideoPlayPosition + widget.positionTag.toString(), (arg) {
    //   setState(() {
    //     if (arg == widget.positionTag) {
    //       _controller.play();
    //       videoPrepared = true;
    //     } else {
    //       _controller.pause();
    //     }
    //   });
    // });

    _controller = VideoPlayerController.network(widget.url)
      ..setLooping(true).then((_) {
        if (widget.positionTag == 0 && CarVideoPage.firstInitTimes == 1) {
          CarVideoPage.firstInitTimes = 2;
          _controller.play();
          videoPrepared = true;
          setState(() {});
        }
      });
    videoPrepared = true;
    _controller.play();
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  Future<bool> init() async {
    await _controller.play().onError((error, stackTrace) {
      print("play error:{error.toString()}+{url}+");
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    aspectRatio = _controller.value.aspectRatio;
    return Stack(
      children: <Widget>[
        Container(
          color: Color(0XFF333333),
          child: GestureDetector(
            child: Stack(
              children: <Widget>[
                FutureBuilder(
                  future: init(),
                  builder: (context, snapshot) {
                    print("连接状态"+snapshot.connectionState.toString());
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Center(
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller, key: UniqueKey()),
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                _getPauseView(),
              ],
            ),
            onTap: () {
              if (_controller.value.isPlaying) {
                _controller.pause();
                _hideActionButton = false;
                setState(() {});
              } else {
                _controller.play();
                videoPrepared = true;
                _hideActionButton = true;
                setState(() {});
              }
            },
          ),
        ),
        _getPreviewImage(), //预览图
        _getRightActionView(), //右侧转发，评论按钮
        _getLeftActionView(), //左侧文案
      ],
    );
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
      offstage: _hideActionButton,
      child: Stack(
        children: <Widget>[
          Align(
            child: Container(
              height: 50.0,
              width: 50.0,
              child: Image.asset(Assets.imagesIconPlaying),
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
        // margin: const EdgeInsets.fromLTRB(0, 0, 15, 120.0),
        // child: Column(
        //   children: <Widget>[
        //     Container(
        //       child: Column(children: <Widget>[
        //         LoadAssetImage('icon/icon_video_praise',
        //             width: 36, height: 36),
        //         Text(
        //           "1.6w",
        //           style: TextStyle(
        //               fontSize: 15,
        //               color: Colors.white,
        //               decoration: TextDecoration.none),
        //         ),
        //       ]),
        //     ),
        //     SizedBox(height: 8),
        //     Container(
        //       child: Column(children: <Widget>[
        //         LoadAssetImage('icon/icon_video_msg',
        //             width: 36, height: 36),
        //         Text(
        //           "1.3w",
        //           style: TextStyle(
        //               fontSize: 15,
        //               color: Colors.white,
        //               decoration: TextDecoration.none),
        //         ),
        //       ]),
        //     ),
        //     SizedBox(height: 8),
        //     Container(
        //       child: Column(children: <Widget>[
        //         LoadAssetImage('icon/icon_video_share',
        //             width: 36, height: 36),
        //         Text(
        //           "2.1w",
        //           style: TextStyle(
        //               fontSize: 15,
        //               color: Colors.white,
        //               decoration: TextDecoration.none),
        //         ),
        //       ]),
        //     ),
        //   ],
        // ),
      ),
    );
  }

  /// 左侧文案
  Widget _getLeftActionView() {
    return Positioned(
      bottom: 0,
      child: Container(
        padding: EdgeInsets.all(30),
        width: ScreenUtil().screenWidth,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Text(
                widget.title,
                style: TextStyle(fontSize: 16, color: Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 11, vertical: 6),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color(0XFF000000),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                margin: const EdgeInsets.only(left: 1.0),
                child: Text(
                  '查看详情',
                  style: TextStyle(
                      fontSize: 12.0,
                      color: Color(0XFFF36926),
                      decoration: TextDecoration.none),
                ),
              ),
              onTap: () {

              },
            ),
            SizedBox(
              width: 20,
            ),
            GestureDetector(
              child: Image.asset(Assets.imagesIconPraise,
                  width: 21, height: 20),
              onTap: () {
                Fluttertoast.showToast(msg: "该功能暂未开放敬请期待！");
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // eventBus.off(EventVideoPlayPosition + widget.positionTag.toString());
    _controller.dispose(); //释放播放器资源
  }
}
