import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../bean/hot_search.dart';
import '../../bean/search_suggest_list.dart';

/// File Name: search_page_state
/// Project Name: flutter_test
/// Created By Hongzhang Chen On 2023-03-16
/// Copy Right ©2023-03-16 flutter_test All Right Reserved
class SearchState {
  var hotSearchDetail = <HotSearch>[].obs;
  var searchSuggestList = <SearchSuggestList>[].obs;

}