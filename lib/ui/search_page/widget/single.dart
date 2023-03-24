import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../../../common/E3Classical.dart';
import '../../../generated/assets.dart';

/// File Name: single
/// Project Name: flutter_test
/// Created By Hongzhang Chen On 2023-03-24
/// Copy Right ©2023-03-24 flutter_test All Right Reserved

class Single extends StatefulWidget {
  @override
  State<Single> createState() => _SingleState();
}

class _SingleState extends State<Single> {
  EasyRefreshController refreshController = EasyRefreshController();
  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      controller: refreshController,
      header: E3Classical.getHeader(),
      footer: E3Classical.getFooter(),
      // emptyWidget: logic.getTaskList.length == 0 ? emptyView("暂无数据") : null,
      child: ListView.builder(
          physics: new NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 10),
          shrinkWrap: true,
          itemCount: 15,
          itemBuilder: SingleItem),
      onRefresh: () async {},
      onLoad: () async {},
    );
  }

  Widget SingleItem(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        padding: EdgeInsets.only(left: 20,right: 15),
        child:
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("就让这大雨全部落下", style: TextStyle(fontSize: 14, color: Colors.black87)),
                      SizedBox(height: 2),
                      Text("就让这大雨全部落下", style: TextStyle(fontSize: 12, color: Colors.black54)),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Image.asset(Assets.imagesIconMv, width: 18, height: 18),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Image.asset(Assets.imagesMore, width: 18, height: 18),
                  ),
                ],
              ),
              Divider(height: 20)
            ],
          )

      ),
    );
  }
}
