import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import '../../../../bean/singers_list.dart';

/// File Name: singers_state
/// Project Name: flutter_test
/// Created By Hongzhang Chen On 2023-03-14
/// Copy Right ©2023-03-14 flutter_test All Right Reserved

class SingersState {
  EasyRefreshController refreshController = EasyRefreshController();
  RxList<SingersList> singersList = <SingersList>[].obs;
  var limit = 20.obs;
  var selectName = "全部".obs;
  var selectIndex = 0.obs;
  Map<String, int> singerTypes = {
    "全部": -1,
    "男歌手": 1,
    "女歌手": 2,
    "乐队": 3,
  };
}