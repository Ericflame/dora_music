import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
/// File Name: video_controller
/// Project Name: dora_music
/// Created By Hongzhang Chen On 2023-04-06
/// Copy Right ©2023-04-06 dora_music All Right Reserved

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:screen_brightness/screen_brightness.dart';
import 'package:video_player/video_player.dart';
import 'movie_land_scape.dart';

class MovieRoom extends StatefulWidget {
  String fileUrl = '';

  MovieRoom(this.fileUrl) {}

  @override
  State<StatefulWidget> createState() => MovieRoomState();
}

class MovieRoomState extends State<MovieRoom> {
  VideoPlayerController? _controller;

  //获取当前视频播放的信息
  late VideoPlayerValue videoPlayerValue;

  //当前播放视频的总时长
  late Duration totalDuration;

  //当前播放视频的位置
  late Duration currentDuration;

  //当前视频是否缓存
  bool isBuffer = false;

  bool isPlay = false;

  bool isPress = false;

  late Timer? isPressTimer;

  String tDuration = "0:00:00";
  String cDuration = "0:00:00";

  late Offset startPosition; // 起始位置
  late double movePan; // 偏移量累计总和
  late double layoutWidth; // 组件宽度
  late double layoutHeight; // 组件高度
  String volumePercentage = ''; // 组件位移描述
  bool allowHorizontal = false; // 是否允许快进
  Duration position = const Duration(seconds: 0); // 当前时间
  double brightness = 0.0; //亮度
  bool brightnessOk = false; // 是否允许调节亮度
  bool showSettingDialog = true;

  @override
  void initState() {
    isPressTimer = Timer(const Duration(), () {});
    if (widget.fileUrl.startsWith("http://") ||
        widget.fileUrl.startsWith("https://")) {
      _controller = VideoPlayerController.network(widget.fileUrl)
        ..initialize().then((_) {
          EasyLoading.dismiss();
          _controller!.play();
          mySetState(() {});
        });
    } else if (widget.fileUrl.startsWith('assets/')) {
      _controller = VideoPlayerController.asset(widget.fileUrl)
        ..initialize().then((_) {
          EasyLoading.dismiss();
          _controller!.play();
          mySetState(() {});
        });
    } else {
      _controller = VideoPlayerController.file(File(widget.fileUrl))
        ..initialize().then((_) {
          EasyLoading.dismiss();
          _controller!.play();
          mySetState(() {});
        });
    }
    if (_controller != null) {
      _controller!.removeListener(() {});
      _controller!.addListener(() {
        mySetState(() {
          isPlay = _controller!.value.isPlaying;
          videoPlayerValue = _controller!.value;
          totalDuration = videoPlayerValue.duration;
          currentDuration = videoPlayerValue.position;
          tDuration = totalDuration.toString().substring(0, 7);
          cDuration = currentDuration.toString().substring(0, 7);
          isBuffer = videoPlayerValue.isBuffering;
        });
      });
    }
    super.initState();
  }

  mySetState(callBack) {
    if (mounted) {
      setState(() {
        callBack();
      });
    }
  }

  Future<double> get currentBrightness async {
    try {
      return await ScreenBrightness().current;
    } catch (e) {
      print(e);
      throw 'Failed to get current brightness';
    }
  }

  Future<void> setBrightness(double brightness) async {
    try {
      await ScreenBrightness().setScreenBrightness(brightness);
    } catch (e) {
      print(e);
      throw 'Failed to set brightness';
    }
  }

  @override
  void dispose() {
    _controller?.removeListener(() {});
    _controller?.dispose();
    if (isPressTimer != null) {
      isPressTimer?.cancel();
      isPressTimer = null;
    }

    if (EasyLoading.isShow) {
      EasyLoading.dismiss();
    }
    super.dispose();
  }

  /// 获取开始触碰时亮度和音量
  void _onVerticalDragStart(details) async {
    _reset(context);
    startPosition = details.globalPosition;
    /// 左半区边触摸
    if (startPosition.dx < (layoutWidth / 2)) {
      // brightness = await Screen.brightness;
      try {
        brightness = await ScreenBrightness().current;
        print("当前亮度${brightness.toString()}");
      } catch (e) {
        print('Failed to get current brightness');
      }
      brightnessOk = true;
    }
  }

  /// 累计计算偏移量(下滑减少百分比，上滑增加百分比)
  void _onVerticalDragUpdate(details) {
    if (!_controller!.value.isInitialized) {
      return;
    }
    movePan += (-details.delta.dy);
    print(
        "偏移量/整体高度${movePan.toString()}${(movePan / layoutHeight).toString()}");
    if (startPosition.dx < (layoutWidth / 2)) {
      /// 左边触摸
      if (brightnessOk = true) {
        setState(() {
          volumePercentage = '亮度：${(_setBrightnessValue() * 100).toInt()}%';
          print("现在的亮度和音量值${volumePercentage}");
          showSettingDialog = false;
        });
      }
    } else {
      /// 右边触摸
      setState(() {
        volumePercentage = '音量：${(_setVerticalValue(num: 2) * 100).toInt()}%';
        print("现在的亮度和音量值1${volumePercentage}");
        showSettingDialog = false;
      });
    }
  }

  /// 获取触碰结束时亮度和音量
  void _onVerticalDragEnd(_) async {
    if (!_controller!.value.isInitialized) {
      return;
    }
    /// 左半区边触摸
    if (startPosition.dx < (layoutWidth / 2)) {
      if (brightnessOk) {
        try {
          await ScreenBrightness().setScreenBrightness(_setBrightnessValue());
        } catch (e) {
          print('Failed to set brightness');
        }
        brightnessOk = false;
        // 左边触摸
        setState(() {
          showSettingDialog = true;
        });
      }
    } else {
      // 右边触摸
      await _controller!.setVolume(_setVerticalValue());
      setState(() {
        showSettingDialog = true;
      });
    }
  }

  /// 亮度百分控制,获取亮度大小
  double _setBrightnessValue() {
    double value =
    //toStringAsFixed保留两位小数点
    double.parse((movePan / layoutHeight + brightness).toStringAsFixed(2));
    if (value >= 1.00) {
      value = 1.00;
    } else if (value <= 0.00) {
      value = 0.00;
    }
    return value;
  }

  /// 音量百分控制，获取音量大小
  double _setVerticalValue({int num = 1}) {
    double value = double.parse(
        (movePan / layoutHeight + _controller!.value.volume)
            .toStringAsFixed(num));
    if (value >= 1.0) {
      value = 1.0;
    } else if (value <= 0.0) {
      value = 0.0;
    }
    print("音量大小${value}");
    return value;
  }

  void _reset(BuildContext context) {
    startPosition = const Offset(0, 0);
    movePan = 0;
    layoutHeight = context.size!.height;
    layoutWidth = context.size!.width;
    volumePercentage = '';
  }

  /// 进度条开始滑动
  void _onHorizontalDragStart(DragStartDetails details) async {
    _reset(context);
    if (!_controller!.value.isInitialized) {
      return;
    }
    // 获取当前时间
    position = _controller!.value.position;
    // 暂停成功后才允许快进手势
    allowHorizontal = true;
  }

  /// 计算偏移量，获取当前位置
  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    if (!_controller!.value.isInitialized && !allowHorizontal) {
      return;
    }
    // 累计计算偏移量
    movePan += details.delta.dx;
    double value = _setHorizontalValue();
    print("格式化秒数${value * _controller!.value.duration.inMilliseconds}");
    // 用百分比计算出当前的秒数
    String currentSecond = DateUtil.formatDateMs(
      (value * _controller!.value.duration.inMilliseconds).toInt(),
      format: 'mm:ss',
    );
    if (value >= 0) {
      setState(() {
        volumePercentage = '快进至：$currentSecond';
        showSettingDialog = false;
      });
    } else {
      setState(() {
        volumePercentage = '快退至：${(value * 100).toInt()}%';
        showSettingDialog = false;
      });
    }
  }

  /// 进度条结束滑动
  void _onHorizontalDragEnd(DragEndDetails details) async {
    if (!_controller!.value.isInitialized && !allowHorizontal) {
      return;
    }
    double value = _setHorizontalValue();
    int current = (value * _controller!.value.duration.inMilliseconds).toInt();
    await _controller!.seekTo(Duration(milliseconds: current));
    allowHorizontal = false;
    setState(() {
      showSettingDialog = true;
    });
  }

  double _setHorizontalValue() {
    // 进度条百分控制
    double valueHorizontal =
    double.parse((movePan / layoutWidth).toStringAsFixed(2));
    // 当前进度条百分比
    double currentValue =
        position.inMilliseconds / _controller!.value.duration.inMilliseconds;
    double value =
    double.parse((currentValue + valueHorizontal).toStringAsFixed(2));
    print(
        "偏移量${movePan},偏移百分比${movePan / layoutWidth},进度条不知道什么参数${_controller!.value.duration.inMilliseconds}进度条百分比${position.inMilliseconds / _controller!.value.duration.inMilliseconds},value${value}");
    if (value >= 1.00) {
      value = 1.00;
    } else if (value <= 0.00) {
      value = 0.00;
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: _controller != null
          ? Container(
        margin: EdgeInsets.only(top: 10),
        color: Colors.grey,
        child:
        Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          if (!_controller!.value.isInitialized)
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 221,
                  width: ScreenUtil().screenWidth,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          if (_controller!.value.isInitialized)
            Stack(
              alignment: Alignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            GestureDetector(
                              onVerticalDragStart: _onVerticalDragStart,
                              onVerticalDragUpdate: _onVerticalDragUpdate,
                              onVerticalDragEnd: _onVerticalDragEnd,
                              onHorizontalDragStart:
                              _onHorizontalDragStart,
                              onHorizontalDragUpdate:
                              _onHorizontalDragUpdate,
                              onHorizontalDragEnd: _onHorizontalDragEnd,
                              onLongPress: () {
                                _controller!.setPlaybackSpeed(2);
                              },
                              onLongPressUp: () {
                                _controller!.setPlaybackSpeed(1);
                              },
                              onDoubleTap: () {
                                _controller!.value.isPlaying
                                    ? _controller!.pause()
                                    : _controller!.play();
                              },
                              onTap: () {
                                setState(() {
                                  isPress = !isPress;
                                });
                                if (isPressTimer != null) {
                                  isPressTimer?.cancel();
                                  isPressTimer = null;
                                }
                                isPressTimer = Timer(
                                    const Duration(milliseconds: 5000),
                                        () {
                                      setState(() {
                                        isPress = false;
                                      });
                                    });
                              },
                              child: Container(
                                  color: Colors.black,
                                  alignment: Alignment.topCenter,
                                  child: AspectRatio(
                                      aspectRatio:
                                      _controller!.value.aspectRatio,
                                      child: VideoPlayer(_controller!))),
                            ),
                            if (_controller!.value.isInitialized &&
                                isPress)
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      _controller!.value.isPlaying
                                          ? _controller!.pause()
                                          : _controller!.play();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          bottom: 5),
                                      child: Icon(
                                        _controller!.value.isPlaying
                                            ? Icons.pause
                                            : Icons.play_arrow,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                        padding:
                                        const EdgeInsets.only(bottom: 5),
                                        child: VideoProgressIndicator(
                                          _controller!,
                                          allowScrubbing: true,
                                          colors: const VideoProgressColors(
                                              backgroundColor: Colors.white24,
                                              bufferedColor: Colors.white,
                                              playedColor: Colors.pinkAccent),
                                        ),
                                      )),
                                  Container(
                                    margin:
                                    const EdgeInsets.only(left: 5),
                                    child: Text(
                                      "$cDuration/$tDuration",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 9),
                                    ),
                                  ),
                                  GestureDetector(
                                    ///进入全屏页面
                                    onTap: () {
                                      Get.to(MovieBigLandScape(
                                          videoController:
                                          _controller!));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          bottom: 5),
                                      child: const Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                        if (!isPress)
                          VideoProgressIndicator(
                            _controller!,
                            allowScrubbing: true,
                            colors: const VideoProgressColors(
                                backgroundColor: Colors.white24,
                                bufferedColor: Colors.white,
                                playedColor: Colors.pinkAccent),
                          )
                      ],
                    ),
                    if (isBuffer)
                      const SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        ),
                      )
                  ],
                ),
                Offstage(
                  offstage: showSettingDialog,
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    padding: const EdgeInsets.only(
                        left: 5, right: 5, top: 2, bottom: 2),
                    child: Text(
                      volumePercentage,
                      style: const TextStyle(
                          color: Colors.black, fontSize: 15),
                    ),
                  ),
                )
              ],
            ),
        ]),
      )
          : Container(),
    );
  }
}
