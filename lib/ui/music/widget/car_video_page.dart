
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../../bean/suggest_video.dart';
import '../../../http/service.dart';
import 'car_short_video.dart';

class CarVideoPage extends StatefulWidget {
  static int firstInitTimes = 1;
  @override
  _CarVideoPageState createState() => _CarVideoPageState();
}


class _CarVideoPageState extends State<CarVideoPage> {
  PageController controller = PageController();
  List<SuggestVideo> carList = [];
  int pageNum = 1;
  bool _pageState = true;

  @override
  void initState() {
    super.initState();
    getSuggestVideo();
  }

  //  获取推荐视频
  getSuggestVideo() {
    Map<String, dynamic> param = {
      "offset":"1"
    };
    EasyLoading.show();
    Service.getSuggestVideo(param).then((value) {
      if (value != null) {
        setState(() {
          carList = value;
          print("哈哈"+carList[1].data!.urlInfo!.url.toString()??"");
        });
        EasyLoading.dismiss();
      }
    });
  }


  List<Widget> _buildListItem() {
    List<Widget> items = <Widget>[];
    if (carList.length > 0) {
      var i = 0;
      carList.forEach((element) {
        if(element.data!=null){
          items.add(CarShortVideo(
            url:element.data == null?"":element.data!.urlInfo==null?"":element.data!.urlInfo!.url??"",
            previewImageUrl:"",
            positionTag: i,
            title: element.data!.title??"",
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
        onPageChanged: (int index){
          if(_pageState){
            if(index%9 == 0){
              getSuggestVideo()();
            }
          }
          // eventBus.emit(
          //     EventVideoPlayPosition + index.toString(),
          //     index);
          setState(() {

          });
        },
      ),
    )
        :Scaffold(
      body: Container(color: Colors.red,),
    ) ;
  }

  @override
  void dispose() {
    super.dispose();
    CarVideoPage.firstInitTimes = 1;
  }
}
