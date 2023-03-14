import 'package:get/get.dart';
import '../../../../bean/mv_top.dart';
import '../../../../bean/play_list.dart';
import '../../../../bean/radio_list.dart';
class ExploreState {
  RxList<MvTop> topMvList = <MvTop>[].obs;
  RxList<PlayList> playList = <PlayList>[].obs;
  RxList<RadioList> radioList = <RadioList>[].obs;
}