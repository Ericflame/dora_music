import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../bean/mv_top.dart';
import '../../bean/play_list.dart';
import '../../bean/radio_list.dart';
import '../home_logic.dart';

class SongsView extends StatefulWidget {
  @override
  _SongsViewState createState() => _SongsViewState();
}

class _SongsViewState extends State<SongsView> {
  final logic = Get.put(HomeLogic());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
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
                      "播放全部",
                      style: TextStyle(fontSize: 12),
                    )),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: Text("共1首", style: TextStyle(fontSize: 12)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                height: 1,
              ),
              // ListView.builder(
              //     physics: new NeverScrollableScrollPhysics(),
              //     padding: EdgeInsets.only(top: 0),
              //     shrinkWrap: true,
              //     itemCount: 0,
              //     itemBuilder: SongListItem)
            ],
          ),
        ),
      ],
    ));
  }

                                                                                                                                                                                                                    // Widget SongListItem(BuildContext context, int index) {
  //   MvTop data = logic.topMvList[index];
  //   return GestureDetector(
  //     onTap: () {},
  //     child: Container(
  //       height: 70,
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //       ),
  //       padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
  //       child: Row(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: <Widget>[
  //           Stack(
  //             children: [
  //               Container(
  //                 width: 60,
  //                 height: 60,
  //                 decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5))),
  //               ),
  //               Container(
  //                 // margin: EdgeInsets.only(top: 8),
  //                   child: Image.network(
  //                     "${data.cover}",
  //                     width: 60,
  //                     height: 60,
  //                   )),
  //             ],
  //           ),
  //           SizedBox(
  //             width: 10,
  //           ),
  //           Expanded(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: <Widget>[
  //                 SizedBox(
  //                   height: 10,
  //                 ),
  //                 Row(
  //                   children: [
  //                     Expanded(
  //                         child: Text(
  //                           "${data.name}",
  //                           style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black),
  //                           maxLines: 1,
  //                           overflow: TextOverflow.ellipsis,
  //                         )),
  //                     SizedBox(
  //                       width: 10,
  //                     ),
  //                     Text(
  //                       "${data.artistName}",
  //                       textAlign: TextAlign.right,
  //                       style: TextStyle(fontSize: 12, color: Color(0xFF15c5fc)),
  //                       maxLines: 1,
  //                       overflow: TextOverflow.ellipsis,
  //                     ),
  //                   ],
  //                 ),
  //                 SizedBox(
  //                   height: 5,
  //                 ),
  //                 Container(
  //                   child: Text(
  //                     "点赞量:${data.playCount}",
  //                     maxLines: 1,
  //                     overflow: TextOverflow.ellipsis,
  //                     style: TextStyle(fontSize: 12, color: Colors.grey),
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 5,
  //                 ),
  //                 Divider(
  //                   height: 0.5,
  //                 )
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
