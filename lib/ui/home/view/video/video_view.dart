import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'video_logic.dart';

///视频
class VideoPage extends StatefulWidget {

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  final logic = Get.put(VideoLogic());

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}