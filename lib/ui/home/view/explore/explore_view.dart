import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../bean/mv_top.dart';
import '../../../../bean/play_list.dart';
import '../../../../bean/radio_list.dart';
import 'explore_logic.dart';
import 'explore_state.dart';
///推荐
class ExploreView extends StatefulWidget {
  @override
  _ExploreViewState createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  final logic = Get.put(ExploreLogic());
  ExploreState state = ExploreState();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    state = logic.state;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Obx(() {
          return Column(
            children: [
              if(state.topMvList.length>0)
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 5, left: 10, right: 10),
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                              child: Text(
                                "最热MV",
                                style: TextStyle(fontSize: 12),
                              )),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            child: Text("了解所有", style: TextStyle(fontSize: 12)),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 5,
                    ),
                    ListView.builder(
                        physics: new NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(top: 0),
                        shrinkWrap: true,
                        itemCount: state.topMvList.length,
                        itemBuilder: SongItem)
                  ],
                ),
              ),
              if(state.playList.length>0)
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                              child: Text(
                                "精品歌单",
                                style: TextStyle(fontSize: 12),
                              )),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            child: Text("了解所有", style: TextStyle(fontSize: 12)),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 5,
                    ),
                    ListView.builder(
                        physics: new NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(top: 0),
                        shrinkWrap: true,
                        itemCount: state.playList.length,
                        itemBuilder: playListItem)
                  ],
                ),
              ),
              if(state.radioList.length>0)
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                              child: Text(
                                "推荐电台",
                                style: TextStyle(fontSize: 12),
                              )),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            child: Text("了解所有", style: TextStyle(fontSize: 12)),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 5,
                    ),
                    ListView.builder(
                        physics: new NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(top: 0),
                        shrinkWrap: true,
                        itemCount: state.radioList.length,
                        itemBuilder: radioListItem)
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget SongItem(BuildContext context, int index) {
    MvTop data = state.topMvList[index];
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
                Container(
                  // margin: EdgeInsets.only(top: 8),
                    child:
                    CachedNetworkImage(
                      imageUrl: data.cover!, width: 60, height: 60,
                      // placeholder: (context, url) => CircularProgressIndicator(color: Colors.black54,strokeWidth: 4,),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    // Image.network(
                    //   "${data.cover}",
                    //   width: 60,
                    //   height: 60,
                    // )
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                            "${data.name}",
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${data.artistName}",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 12, color: Color(0xFF15c5fc)),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Text(
                      "点赞量:${data.playCount}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(
                    height: 0.5,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget playListItem(BuildContext context, int index) {
    PlayList data = state.playList[index];
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                // margin: EdgeInsets.only(top: 8),
                child: Image.network(
                  "${data.coverImgUrl}",
                )),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                            "${data.name}",
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )),
                      // SizedBox(
                      //   width: 10,
                      // ),
                      // Text(
                      //   "${data.signature}",
                      //   textAlign: TextAlign.right,
                      //   style: TextStyle(fontSize: 12, color: Color(0xFF15c5fc)),
                      //   maxLines: 1,
                      //   overflow: TextOverflow.ellipsis,
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    child: Text(
                      "${data.description}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(
                    height: 0.5,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget radioListItem(BuildContext context, int index) {
    RadioList data = state.radioList[index];
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                // margin: EdgeInsets.only(top: 8),
                child: Image.network(
                  "${data.picUrl}",
                )),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                            "${data.name}",
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )),
                      // SizedBox(
                      //   width: 10,
                      // ),
                      // Text(
                      //   "${data.signature}",
                      //   textAlign: TextAlign.right,
                      //   style: TextStyle(fontSize: 12, color: Color(0xFF15c5fc)),
                      //   maxLines: 1,
                      //   overflow: TextOverflow.ellipsis,
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    child: Text(
                      "${data.copywriter}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(
                    height: 0.5,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
