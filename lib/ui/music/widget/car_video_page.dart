import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../../bean/suggest_video.dart';
import '../../../http/service.dart';
import 'car_short_video.dart';
import 'keep_alive_wrapper.dart';

class CarVideoPage extends StatefulWidget {
  static int firstInitTimes = 1;
  @override
  _CarVideoPageState createState() => _CarVideoPageState();
}

class _CarVideoPageState extends State<CarVideoPage> {
  PageController controller = PageController(); //分页控制器
  List<SuggestVideo> carList = []; //视频列表
  bool _pageState = true;

  @override
  void initState() {
    super.initState();
    getSuggestVideo();
  }

  //  获取推荐视频
  getSuggestVideo() {
    Map<String, dynamic> param = {"offset": 10};
    EasyLoading.show();
    Service.getSuggestVideo(param).then((value) {
      setState(() {
        carList.addAll(value);
      });
      EasyLoading.dismiss();
    });
  }

  List<Widget> _buildListItem() {
    List<Widget> items = <Widget>[];
    if (carList.length > 0) {
      var i = 0;
      carList.forEach((element) {
        // String list= "";
        // if(element.data!=null){
        //   if(element.data!.videoGroup!=null){
        //     element.data!.videoGroup!.forEach((element) {
        //       list = list+" "+element.name!;
        //     });
        //   }
        // }
        if (element.data != null) {
          items.add(KeepAliveWrapper(
            child: CarShortVideo(
              url: element.data == null ? "" : element.data!.urlInfo == null ? "" : element.data!.urlInfo!.url ?? "",
              nickName: element.data == null ? "" : element.data!.creator == null ? "" : element.data!.creator!.nickname ?? "",
              group: "",
              positionTag: i,
              title: element.data!.title ?? "",
            ),
          ));
        }
        i++;
      });
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return carList.length > 0
        ? Scaffold(
            body: PageView(
              children: _buildListItem(),
              controller: controller,
              scrollDirection: Axis.vertical,
              onPageChanged: (int index) {
                if (_pageState) {
                  if (index != 0 && index % 7 == 0) {
                    getSuggestVideo();
                  }
                }
                setState(() {});
              },
            ),
          )
        : Scaffold(
            body: Container(
              color: Colors.red,
            ),
          );
  }

  @override
  void dispose() {
    super.dispose();
    CarVideoPage.firstInitTimes = 1;
  }
}
