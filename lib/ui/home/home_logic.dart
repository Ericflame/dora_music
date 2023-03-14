import 'package:flutter/material.dart';
import 'package:flutter_advanced/http/service.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'home_state.dart';

class HomeLogic extends GetxController with GetSingleTickerProviderStateMixin {
  HomeState state = HomeState();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    state.controller = TabController(length: state.tabs.length, vsync: this);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}
