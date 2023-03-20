import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:get/get.dart';
import 'music_cloud_logic.dart';

///小视频
class MusicCloudPage extends StatelessWidget {
  final logic = Get.put(MusicCloudLogic());

  @override
  Widget build(BuildContext context) {
    return Cube(onSceneCreated: _onSceneCreated);
  }

  void _onSceneCreated(Scene scene) {
    scene.camera.position.z = 10;
    scene.camera.target.y = 2;
    scene.world.add(Object(scale: Vector3(10.0, 10.0, 10.0), fileName: 'assets/models/049_Ken.obj'));
  }
}
