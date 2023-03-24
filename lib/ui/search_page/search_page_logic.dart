import 'package:flutter_advanced/ui/search_page/search_page_state.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../http/service.dart';

class SearchPageLogic extends GetxController {
  SearchState state = SearchState();
  //  获取歌手Mv
  getSingerMv() {
    Map<String, dynamic> param = {};
    EasyLoading.show();
    Service.getHotSearch(param).then((value) {
      if (value != null) {
        state.hotSearchDetail.value = value;
        EasyLoading.dismiss();
      }
    });
  }
  //  获取搜索推荐
  getSearchSuggest(String e) {
    Map<String, dynamic> param = {
      "type":"mobile",
      "keywords":e
    };
    // EasyLoading.show();
    Service.getSearchSuggest(param).then((value) {
      if (value != null) {
        state.searchSuggestList.value = value;
        // EasyLoading.dismiss();
      }
    });
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getSingerMv();
  }
}
