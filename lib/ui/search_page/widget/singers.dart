import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../bean/search_artists.dart';
import '../../../http/service.dart';
import '../../../utils/eventbus/event_bus_handler.dart';

/// File Name: singers
/// Project Name: flutter_test
/// Created By Hongzhang Chen On 2023-03-24
/// Copy Right ©2023-03-24 flutter_test All Right Reserved
class Singers extends StatefulWidget {
  String keywords;
  Singers(this.keywords);
  @override
  State<Singers> createState() => _SingersState();
}

class _SingersState extends State<Singers> {
  var artists = <SearchArtists>[].obs;
  StreamSubscription? streamSubscription;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSearchDetail(widget.keywords);
    streamSubscription = EventBusHandler.listen((event) {
      if (event.code == "2") {
        print("歌手列表刷新");
        getSearchDetail(event.data);
      }
    });
  }

  // 获取搜索结果（歌手）
  Future getSearchDetail(String keywords) async{
    ///type:100 歌手
    Map<String, dynamic> param = {"keywords": keywords, "type": 100, "limit": 15};
    EasyLoading.show();
    Service.getSearchDetail(param).then((value) {
      if (value.artists != null) {
        artists.value = value.artists ?? [];
        EasyLoading.dismiss();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        margin: EdgeInsets.only(left: 15,top: 15,right: 15),
        child: ListView.builder(
            physics: new NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(top: 0),
            shrinkWrap: true,
            itemCount: artists.length,
            itemBuilder: (BuildContext context, int index) {
              SearchArtists item = artists[index];
              return
              Column(
                children: [
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: CachedNetworkImage(
                            imageUrl: "${item.picUrl ?? ""}",
                            placeholder: (context, url) => Padding(padding: EdgeInsets.all(20),child: CircularProgressIndicator(color: Colors.black54,strokeWidth: 2)),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              formSpan("${item.name ?? ""}",widget.keywords),
                              style: TextStyle(fontSize: 13, color: Colors.black87),
                            ),
                            // Text("${item.name ?? ""}",style: TextStyle(fontSize: 15)),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Text("专辑:${item.albumSize ?? 0}",style: TextStyle(fontSize: 12,color: Colors.grey)),
                                SizedBox(width: 10),
                                Text("视频:${item.mvSize ?? 0}",style: TextStyle(fontSize: 12,color: Colors.grey)),
                              ],
                            )
                          ],
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.only(left: 8,top: 1,bottom: 1,right: 8),
                          decoration: BoxDecoration(
                            //设置四周圆角 角度
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            //设置四周边框
                            border: new Border.all(width: .5, color: Colors.grey),
                          ),
                          child: Text("+  关注",style: TextStyle(fontSize: 13)),
                        )
                      ],
                    ),
                  ),Divider(height: 15,)
                ],
              );
            }),
      );
    });
  }

  ///高亮某些文字
  final TextStyle lightTextStyle = const TextStyle(
    color: Colors.blue,
    fontWeight: FontWeight.bold,
  );

  InlineSpan formSpan(String src, String pattern) {
    List<TextSpan> span = [];
    List<String> parts = src.split(pattern);
    if (parts.length > 1) {
      for (int i = 0; i < parts.length; i++) {
        span.add(TextSpan(text: parts[i]));
        if (i != parts.length - 1) {
          span.add(TextSpan(text: pattern, style: lightTextStyle));
        }
      }
    } else {
      span.add(TextSpan(text: src));
    }
    return TextSpan(children: span);
  }
}
