import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'music_logic.dart';

class MusicPage extends StatelessWidget {
  final logic = Get.put(MusicLogic());

  @override
  Widget build(BuildContext context) {
    return Container(child: Text("音乐"),);
  }
}
