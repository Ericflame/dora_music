/// File Name: singers_logic
/// Project Name: flutter_test
/// Created By Hongzhang Chen On 2023-03-14
/// Copy Right ©2023-03-14 flutter_test All Right Reserved

import 'package:dora_music/http/service.dart';
import 'package:dora_music/ui/home/view/singers/singers_state.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';

class SingersLogic extends GetxController{
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
    getSingersList();
  }

  //  获取歌手
  getSingersList() {
    EasyLoading.show();
    Map<String,dynamic> param = {
      'limit': state.limit.value, 'type': state.singerTypes[state.selectName], 'area': -1
    };
    Service.getSingersList(param).then((value) {
      state.singersList.value = value;
      EasyLoading.dismiss();
    });
  }
}
