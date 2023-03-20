import 'package:flutter_advanced/http/service.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'explore_state.dart';

class ExploreLogic extends GetxController{
  ExploreState state = ExploreState();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getMvTop();
    getPlayList();
    getRadioList();
  }

  ///  获取Mv排名
  getMvTop() {
    Map<String,dynamic> param = {
      'limit': 3
    };
    EasyLoading.show();
    Service.getSongs(param).then((value) {
      state.topMvList.value = value;
      EasyLoading.dismiss();
    });
  }

  ///  获取精品歌单
  getPlayList() {
    Map<String,dynamic> param = {
      'limit': 3
    };
    EasyLoading.show();
    Service.getPlayList(param).then((value) {
      state.playList.value = value;
      EasyLoading.dismiss();
    });
  }

  ///  获取电台
  getRadioList() {
    EasyLoading.show();
    Service.getRadioList().then((value) {
      state.radioList.value = value;
      EasyLoading.dismiss();
    });
  }
}
