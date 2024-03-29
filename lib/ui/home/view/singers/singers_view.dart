import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dora_music/ui/home/View/singers/singers_detail/singers_detail_view.dart';
import 'package:dora_music/ui/home/view/singers/singers_logic.dart';
import 'package:dora_music/ui/home/view/singers/singers_state.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';

import '../../../../bean/singers_list.dart';
import '../../../../common/E3Classical.dart';

///歌手
class SingersView extends StatefulWidget {
  @override
  _SingersViewState createState() => _SingersViewState();
}

class _SingersViewState extends State<SingersView> {
  final logic = Get.put(SingersLogic());
  SingersState state = SingersState();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    state = logic.state;
  }
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SingerButton("全部", 0),
                SingerButton("男歌手", 1),
                SingerButton("女歌手", 2),
                SingerButton("组合", 3),
              ],
            ),
          ),
          Container(
            height: 10,
          ),
          Divider(
            height: 0.5,
          ),
          Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                child: EasyRefresh(
                  controller: state.refreshController,
                  header: E3Classical.getHeader(),
                  footer: E3Classical.getFooter(),
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        //横轴元素个数
                          crossAxisCount: 3,
                          //纵轴间距
                          mainAxisSpacing: 10,
                          //横轴间距
                          crossAxisSpacing: 20.0,
                          //子组件宽高长度比例
                          childAspectRatio: 1.0),
                      itemCount: state.singersList.length,
                      itemBuilder: SingersItem),
                  onRefresh: () async {
                    logic.getSingersList();
                  },
                  onLoad: () async {
                    state.limit.value += 10;
                    logic.getSingersList();
                  },
                ),
              ))
        ],
      );
    });
  }

  Widget SingerButton(String text, int index) {
    return Obx(() {
      return GestureDetector(
        onTap: () {
          state.selectIndex.value = index;
          state.selectName.value = text;
          logic.getSingersList();
        },
        child: Container(
          width: 50,
          height: 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: state.selectIndex.value == index ? Color(0xFFb0daf4) : Colors.white),
          child: Text(
            text,
            style: TextStyle(fontSize: 12,color: state.selectIndex.value == index ? Colors.white : Colors.black87),
            textAlign: TextAlign.center,
          ),
        ),
      );
    });
  }

  Widget SingersItem(BuildContext context, int index) {
    SingersList data = state.singersList[index];
    return Column(
      children: [
        GestureDetector(
            onTap: () {
              Get.to(() => Singers_detailPage(), arguments: {"artistId": data.id});
            },
            child: Container(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CachedNetworkImage(
                placeholder: (context, url) => Padding(padding: EdgeInsets.all(20),child: CircularProgressIndicator(color: Colors.black54,strokeWidth: 2)),
                imageUrl: data.img1v1Url!, width: 60, height: 60,
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ))),
        Text("${data.name}")
      ],
    );
  }
}
