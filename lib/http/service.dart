import 'package:flutter_advanced/constant.dart';
import 'package:flutter_advanced/http/httpRequest.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../bean/common_response.dart';
import '../bean/hot_search.dart';
import '../bean/hot_search.dart';
import '../bean/hot_search.dart';
import '../bean/mv_top.dart';
import '../bean/mvs.dart';
import '../bean/play_list.dart';
import '../bean/play_list_response.dart';
import '../bean/radio_list.dart';
import '../bean/radio_list_response.dart';
import '../bean/singer_album_response.dart';
import '../bean/singer_details.dart';
import '../bean/singer_details_response.dart';
import '../bean/singer_hot_album.dart';
import '../bean/singers_details.dart';
import '../bean/singers_details_response.dart';
import '../bean/singers_list.dart';
import '../bean/singers_list_response.dart';
import '../bean/singers_mvs_response.dart';

class Service {
  /// mv 排行
  static Future<List<MvTop>> getSongs(Map<String, dynamic> param) async {
    final response = await HttpRequest.getInstance().futureGet(
      API.getMvTop,
      queryParameters: param,
    );
    if (response != null) {
      CommonResponse result = CommonResponse.fromJson(response, (json) => json);
      return (result.data as List<dynamic>).map((e) => MvTop.fromJson(e as Map<String, dynamic>)).toList();
    } else {
      EasyLoading.dismiss();
      return [];
    }
  }

  /// 获取精品歌单
  static Future<List<PlayList>> getPlayList(Map<String, dynamic> param) async {
    final response = await HttpRequest.getInstance().futureGet(
      API.getPlayList,
      queryParameters: param,
    );
    if (response != null) {
      PlayListResponse result = PlayListResponse.fromJson(response, (json) => json);
      return (result.playlists as List<dynamic>).map((e) => PlayList.fromJson(e as Map<String, dynamic>)).toList();
    } else {
      EasyLoading.dismiss();
      return [];
    }
  }

  /// 获取电台列表
  static Future<List<RadioList>> getRadioList() async {
    final response = await HttpRequest.getInstance().futureGet(
      API.getRadioList,
      queryParameters: {},
    );
    if (response != null) {
      RadioListResponse result = RadioListResponse.fromJson(response, (json) => json);
      return (result.result as List<dynamic>).map((e) => RadioList.fromJson(e as Map<String, dynamic>)).toList();
    } else {
      EasyLoading.dismiss();
      return [];
    }
  }

  /// 获取歌手列表
  static Future<List<SingersList>> getSingersList(Map<String, dynamic> param) async {
    final response = await HttpRequest.getInstance().futureGet(
      API.getSingersList,
      queryParameters: param,
    );
    if (response != null) {
      SingersListResponse result = SingersListResponse.fromJson(response, (json) => json);
      return (result.artists as List<dynamic>).map((e) => SingersList.fromJson(e as Map<String, dynamic>)).toList();
    } else {
      EasyLoading.dismiss();
      return [];
    }
  }

  /// 获取歌手详情
  static Future<SingersDetailResponse> getSingersDetails(Map<String, dynamic> param) async {
    final response = await HttpRequest.getInstance().futureGet(
      API.getSingersDetails,
      queryParameters: param,
    );
    if (response != null) {
      SingersDetailResponse result = SingersDetailResponse.fromJson(response, (json) => json);
      return result;
    } else {
      EasyLoading.dismiss();
      return SingersDetailResponse();
    }
  }

  /// 获取歌手详细详情
  static Future<List<SingerDetails>> getSingerDetails(Map<String, dynamic> param) async {
    final response = await HttpRequest.getInstance().futureGet(
      API.getSingerDetails,
      queryParameters: param,
    );
    if (response != null) {
      SingerDetailResponse result = SingerDetailResponse.fromJson(response, (json) => json);
      return (result.introduction as List<dynamic>)
          .map((e) => SingerDetails.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      EasyLoading.dismiss();
      return [];
    }
  }

  ///  获取歌手专辑
  static Future<List<SingerHotAlbum>> getSingerAlbum(Map<String, dynamic> param) async {
    final response = await HttpRequest.getInstance().futureGet(
      API.getSingerAlbum,
      queryParameters: param,
    );
    if (response != null) {
      SingerAlbumResponse result = SingerAlbumResponse.fromJson(response, (json) => json);
      return (result.hotAlbums as List<dynamic>)
          .map((e) => SingerHotAlbum.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      EasyLoading.dismiss();
      return [];
    }
  }

  ///  获取歌手Mv
  static Future<List<Mvs>> getSingerMv(Map<String, dynamic> param) async {
    final response = await HttpRequest.getInstance().futureGet(
      API.getSingerMv,
      queryParameters: param,
    );
    if (response != null) {
      SingersMvResponse result = SingersMvResponse.fromJson(response, (json) => json);
      return (result.mvs as List<dynamic>).map((e) => Mvs.fromJson(e as Map<String, dynamic>)).toList();
    }else{
      EasyLoading.dismiss();
      return [];
    }
  }
  ///  热门搜索
  static Future<List<HotSearch>> getHotSearch(Map<String, dynamic> param) async {
    final response = await HttpRequest.getInstance().futureGet(
      API.getHotSearch,
      queryParameters: param,
    );
    if (response != null) {
      CommonResponse result = CommonResponse.fromJson(response, (json) => json);
      return (result.data as List<dynamic>).map((e) => HotSearch.fromJson(e as Map<String, dynamic>)).toList();
    }else{
      EasyLoading.dismiss();
      return [];
    }
  }
}
