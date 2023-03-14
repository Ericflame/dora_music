import 'package:flutter_advanced/http/service.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'explore_state.dart';

class ExploreLogic extends GetxController with GetSingleTickerProviderStateMixin {
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

  //  获取Mv排名
  getMvTop() {
    Service.getSongs(3).then((value) {
      state.topMvList.value = value;
      // print(value[0].cover.toString());
    });
  }

  //  获取精品歌单
  getPlayList() {
    Service.getPlayList(3).then((value) {
      state.playList.value = value;
      // print(value[0].name.toString());
    });
  }

  //  获取电台
  getRadioList() {
    Service.getRadioList().then((value) {
      state.radioList.value = value;
    });
  }
}
