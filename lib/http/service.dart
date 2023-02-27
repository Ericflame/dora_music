import 'package:flutter_advanced/constant.dart';
import 'package:flutter_advanced/http/httpRequest.dart';

import '../bean/common_response.dart';
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
import 'http.dart';

class Service {
  /// mv 排行
  static Future getSongs(int param) async {
    final response = await HttpRequest().futureGet(
      API.getMvTop,
      queryParameters: {'limit': param},
    );
    CommonResponse result = CommonResponse.fromJson(response, (json) => json);
    List<MvTop> data =
    (result.data as List<dynamic>).map((e) => MvTop.fromJson(e as Map<String, dynamic>)).toList();
    return data;
  }
  /// 获取精品歌单
  static Future getPlayList(int param) async {
    final response = await HttpRequest().futureGet(
      API.getPlayList,
      queryParameters: {'limit': param},
    );
    PlayListResponse result = PlayListResponse.fromJson(response, (json) => json);
    List<PlayList> data =
    (result.playlists as List<dynamic>).map((e) => PlayList.fromJson(e as Map<String, dynamic>)).toList();
    return data;
  }
  /// 获取电台列表
  static Future getRadioList() async {
    final response = await HttpRequest().futureGet(
      API.getRadioList,
      queryParameters: {},
    );
    RadioListResponse result = RadioListResponse.fromJson(response, (json) => json);
    List<RadioList> data =
    (result.result as List<dynamic>).map((e) => RadioList.fromJson(e as Map<String, dynamic>)).toList();
    return data;
  }
  /// 获取歌手列表
  static Future getSingersList(int limit,int type,int area) async {
    final response = await HttpRequest().futureGet(
      API.getSingersList,
      queryParameters: {'limit': limit,'type': type,'area': area},
    );
    SingersListResponse result = SingersListResponse.fromJson(response, (json) => json);
    List<SingersList> data =
    (result.artists as List<dynamic>).map((e) => SingersList.fromJson(e as Map<String, dynamic>)).toList();
    return data;
  }
  /// 获取歌手详情
  static Future getSingersDetails(int id) async {
    final response = await HttpRequest().futureGet(
      API.getSingersDetails,
      queryParameters: {'id': id},
    );
    SingersDetailResponse result = SingersDetailResponse.fromJson(response, (json) => json);
    return result;
  }

  /// 获取歌手详细详情
  static Future getSingerDetails(int id) async {
    final response = await HttpRequest().futureGet(
      API.getSingerDetails,
      queryParameters: {'id': id},
    );
    SingerDetailResponse result = SingerDetailResponse.fromJson(response, (json) => json);
    List<SingerDetails> data =
    (result.introduction as List<dynamic>).map((e) => SingerDetails.fromJson(e as Map<String, dynamic>)).toList();
    return data;
  }

  ///  获取歌手专辑
  static Future getSingerAlbum(int id,int limit) async {
    final response = await HttpRequest().futureGet(
      API.getSingerAlbum,
      queryParameters: {'id': id,"limit":limit},
    );
    SingerAlbumResponse result = SingerAlbumResponse.fromJson(response, (json) => json);
    List<SingerHotAlbum> data =
    (result.hotAlbums as List<dynamic>).map((e) => SingerHotAlbum.fromJson(e as Map<String, dynamic>)).toList();
    return data;
  }

  ///  获取歌手Mv
  static Future getSingerMv(int id) async {
    final response = await HttpRequest().futureGet(
      API.getSingerMv,
      queryParameters: {'id': id},
    );
    SingersMvResponse result = SingersMvResponse.fromJson(response, (json) => json);
    List<Mvs> data =
    (result.mvs as List<dynamic>).map((e) => Mvs.fromJson(e as Map<String, dynamic>)).toList();
    return data;
  }
}
