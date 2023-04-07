/// File Name: movie_land_scape
/// Project Name: dora_music
/// Created By Hongzhang Chen On 2023-04-06
/// Copy Right ©2023-04-06 dora_music All Right Reserved
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_player/video_player.dart';
/// 全屏页面
class MovieBigLandScape extends StatefulWidget {
  //参数传递定义
  final VideoPlayerController videoController;

  const MovieBigLandScape({Key? key, required this.videoController})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => MovieBigLandScapeState();
}

class MovieBigLandScapeState extends State<MovieBigLandScape> {
  bool isPress = false;
  late Timer? isPressTimer;

  //获取当前视频播放的信息
  late VideoPlayerValue videoPlayerValue;

  //当前播放视频的总时长
  late Duration totalDuration;

  //当前播放视频的位置
  late Duration currentDuration;

  String tDuration = "0:00:00";
  String cDuration = "0:00:00";

  //当前视频是否缓存
  bool isBuffer = false;

  @override
  void initState() {
    isPressTimer = Timer(const Duration(), () {});
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft, //全屏时旋转方向，左边
    ]);
    widget.videoController.addListener(() {
      mySetState(() {
        videoPlayerValue = widget.videoController.value;
        totalDuration = videoPlayerValue.duration;
        currentDuration = videoPlayerValue.position;
        tDuration = totalDuration.toString().substring(0, 7);
        cDuration = currentDuration.toString().substring(0, 7);
        isBuffer = videoPlayerValue.isBuffering;
      });
    });
    super.initState();
  }

  mySetState(callBack) {
    if (mounted) {
      setState(() {
        callBack();
      });
    }
  }

  @override
  void dispose() {
    if (isPressTimer != null) {
      isPressTimer?.cancel();
      isPressTimer = null;
    }
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  GestureDetector(
                    /// 双击
                    onDoubleTap: () {
                      widget.videoController.value.isPlaying
                          ? widget.videoController.pause()
                          : widget.videoController.play();
                    },
                    onLongPress: (){
                      widget.videoController.setPlaybackSpeed(2);
                    },
                    onLongPressUp: (){
                      widget.videoController.setPlaybackSpeed(1);
                    },
                    /// 单击显示进度条和全屏按钮
                    onTap: () {
                      setState(() {
                        isPress = !isPress;
                      });
                      if (isPressTimer != null) {
                        isPressTimer?.cancel();
                        isPressTimer = null;
                      }
                      isPressTimer =
                          Timer(const Duration(milliseconds: 5000), () {
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
                            widget.videoController.value.aspectRatio,
                            child: VideoPlayer(widget.videoController))),
                  ),
                  // if (isPress)
                  //   Row(
                  //     children: [
                  //       // 播放按钮
                  //       GestureDetector(
                  //         onTap: () {
                  //           widget.videoController.value.isPlaying
                  //               ? widget.videoController.pause()
                  //               : widget.videoController.play();
                  //         },
                  //         child: Container(
                  //           padding: const EdgeInsets.only(bottom: 5),
                  //           child: Icon(
                  //             widget.videoController.value.isPlaying
                  //                 ? Icons.pause
                  //                 : Icons.play_arrow,
                  //             color: Colors.white,
                  //             size: 30,
                  //           ),
                  //         ),
                  //       ),
                  //       // 进度条
                  //       Expanded(
                  //           child: Container(
                  //             padding: const EdgeInsets.only(bottom: 5),
                  //             child: VideoProgressIndicator(
                  //               widget.videoController,
                  //               allowScrubbing: true,
                  //               colors: const VideoProgressColors(
                  //                   backgroundColor: Colors.white24,
                  //                   bufferedColor: Colors.white,
                  //                   playedColor: Colors.pinkAccent),
                  //             ),
                  //           )),
                  //       Container(
                  //         margin: const EdgeInsets.only(left: 5),
                  //         child: Text(
                  //           "$cDuration/$tDuration",
                  //           style: const TextStyle(
                  //               color: Colors.white, fontSize: 9),
                  //         ),
                  //       ),
                  //       // 全屏
                  //       GestureDetector(
                  //         onTap: () {
                  //           Get.back();
                  //         },
                  //         child: Container(
                  //           padding: const EdgeInsets.only(bottom: 5),
                  //           child: const Icon(
                  //             Icons.play_arrow,
                  //             color: Colors.white,
                  //             size: 30,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                ],
              ),
              if (!isPress)
                VideoProgressIndicator(
                  widget.videoController,
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
    );
  }
}

