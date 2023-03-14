/// File Name: singers_logic
/// Project Name: flutter_test
/// Created By Hongzhang Chen On 2023-03-14
/// Copy Right ©2023-03-14 flutter_test All Right Reserved

import 'package:flutter_advanced/http/service.dart';
import 'package:flutter_advanced/ui/home/view/singers/singers_state.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';

class SingersLogic extends GetxController with GetSingleTickerProviderStateMixin {
  SingersState state = SingersState();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getSingersList(state.limit.value,-1,-1);
  }

  //  获取歌手
  getSingersList(int limit, int type, int area) {
    Service.getSingersList(limit, type, area).then((value) {
      state.singersList.value = value;
    });
  }
}
