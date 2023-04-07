import 'package:dora_music/ui/music/widget/video_controller.dart';
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
  Future getSuggestVideo() async{
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
              shareCount: element.data!.shareCount ?? 0,
              commentCount: element.data!.commentCount ?? 0,
              praisedCount: element.data!.praisedCount ?? 0,
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
            body: MovieRoom("http://vodkgeyttp9.vod.126.net/cloudmusic/wpAoAFSM_2322859615_hd.mp4?ts=1680837425&rid=E349F3448390B1C1661C33A9E342FAFE&rl=3&rs=XbjEBNXLOaPmRmXLBanvVVuPQUrlLqlH&sign=fee6bac4993b0b9c7459371f09949d5f&ext=xpjYDTddelQVS7bDOy0pvOG8J3wj%2FZvBfQsYwoj8QhRCmhcfS%2FPmfj81PVlU2FYLIFa%2Bik4o4ngWJ4M%2B%2BSOakrU7Hp%2B26nS9P2zQ4kwe8Zya6F%2Fco3JUYqjZ1n5L9V5vAAEKW1I6jDUydJ4Hfs5HiAOm8hlBKgkvAcQQ%2FaXQ%2F6Ep7wC%2BEkHysLWERylfN0ejdLND%2FLW3rY1p7TcRYNzCQMeGQWQ8JS9rSBhZO%2F8sHiAj0kBwijjILS5060Yi7J9ciy1wUNjBxDmcTw6zUbhK6Dnd9MUuI4uYQKp%2BfI3PcfCDU1dT0tWlphLdKDMUxJscvQVKb4ZDp4J4JL7G1v4S7Utv9gwNcVBa4pK4NDJQyFGrzFTArhQBJpzHtZhp4B%2BBkInKgq3UhVd85FpxFkzH5iLmjY1ZPN9C4msyMFPf3CrEKZ%2Fey0r3Lwn%2B0Cj7%2BHeUgN8Zq8rRwmKPBFShW%2B3b64%2BMwGZ94bfw%2FjJmdIPwP0rF%2FFM9H9dsX3VMVAoHVEklPfPidx7xjKTfiuKG5Hzdp8KeDKIH1%2BODGw6YyWd1th8%3D"),
          );
  }
  @override
  void dispose() {
    super.dispose();
    CarVideoPage.firstInitTimes = 1;
  }
}
