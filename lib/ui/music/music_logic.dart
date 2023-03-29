import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../http/service.dart';

class MusicLogic extends GetxController {

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    // getSuggestVideo();
  }

  // //  获取推荐视频
  // getSuggestVideo() {
  //   Map<String, dynamic> param = {
  //     "offset":"1"
  //   };
  //   EasyLoading.show();
  //   Service.getSuggestVideo(param).then((value) {
  //     if (value != null) {
  //       // state.hotSearchDetail.value = value;
  //       EasyLoading.dismiss();
  //     }
  //   });
  // }
}
