import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'music_logic.dart';

class MusicPage extends StatefulWidget {
  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  final logic = Get.put(MusicLogic());
  int _pageIndex = 1;
  PageController _pageController = PageController();
  late VideoPlayerController _playerController;
  bool isInitControl = false;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   //网络链接
  //   _playerController = VideoPlayerController.network(
  //       "http://vodkgeyttp9.vod.126.net/vodkgeyttp8/tLd16zFG_2549010438_hd.mp4?ts=1680059188&rid=E349F3448390B1C1661C33A9E342FAFE&rl=3&rs=AWlGSFumgzUdDgtTSNuHaPmsForIocde&sign=e2107d4d2e31219cc6082bf548c4c084&ext=xpjYDTddelQVS7bDOy0pvOG8J3wj%2FZvBfQsYwoj8QhQ3JNsh9LhX3Te3XBAk3Xiw1mivXy2gerw3sPfRXKZx3w1FPHwlobzdyLDLnOCQW7scS2Y%2FLQ4YY06PiSKZyIeKvOtFT9Kc9Hl9gK2V61jdy62WfcdNwXwBU0uibbz3QjFYZc6f%2BjD10mJ%2FiKk%2F99WOwS0%2BW4ijfmtOieDSzFPXwwMTvEC2Mplo7%2FXTO%2FMuvEjhWvPHCE%2B1cXpS7kUElstkOI%2BrbswSmCm%2FF8G9GbO38UPvJ1t1J6qUs3xjsC%2F94eMylKAJs1iAp39ic7Reyj1jgUwFNszSJhsl0B8f1qjyDhGoEs7NjN9n1tBSJkHOEdaBWvczG%2BBYsDy0aAZpxBOQkbZe8yWEgwAbTUxbB38GQ0m08rTKcGgO%2Fx0A3ETrPadU9RHxP6LF4Hn4ySaj8F7ynsta%2BeDOttkX%2FtXl7IbEXzChiqStmvFGDXLlQvkFIwdTnfC1pGqlZL5TIDlrEUFDqUMuOUt2XqJsPggUzuZiEQ%3D%3D");
  //   // VideoPlayerController.file(File(url));
  //   //本地链接
  //   // _videoPlayerController = VideoPlayerController.asset("asset资源路径");
  //   _playerController.initialize()
  //     ..whenComplete(() {
  //       setState(() {
  //         _playerController.play();
  //       });
  //     });
  // }
  @override
  void initState() {
    super.initState();
    _playerController = VideoPlayerController.network("https://vodkgeyttp9.vod.126.net/vodkgeyttp8/WaFzpZVd_128012417_hd.mp4?ts=1680064086&rid=E349F3448390B1C1661C33A9E342FAFE&rl=3&rs=MIJjrQhJRCEOZevDkzJGHyUlRwXIRQpQ&sign=469226106ae4eb23139c4c1dcc95fee8&ext=xpjYDTddelQVS7bDOy0pvOG8J3wj%2FZvBfQsYwoj8QhQ3JNsh9LhX3Te3XBAk3Xiw1mivXy2gerw3sPfRXKZx3w1FPHwlobzdyLDLnOCQW7scS2Y%2FLQ4YY06PiSKZyIeKvOtFT9Kc9Hl9gK2V61jdy62WfcdNwXwBU0uibbz3QjFYZc6f%2BjD10mJ%2FiKk%2F99WOwS0%2BW4ijfmtOieDSzFPXwwMTvEC2Mplo7%2FXTO%2FMuvEjhWvPHCE%2B1cXpS7kUElstkOI%2BrbswSmCm%2FF8G9GbO38UPvJ1t1J6qUs3xjsC%2F94eMylKAJs1iAp39ic7Reyj1jgUwFNszSJhsl0B8f1qjyDhGoEs7NjN9n1tBSJkHOEdaBWvczG%2BBYsDy0aAZpxBOQkbZe8yWEgwAbTUxbB38GQ0m08rTKcGgO%2Fx0A3ETrPacY0HTLbuyMYTYVtc4z5tDY6d6I%2F7AiMG%2FwImLQXZSK8cZDtnTpFrVQejhRiYWgWTRu6I0TyFTrvsyV486xRLBiXsLS7SpR1jrV3mLSHyLIfQ%3D%3D");
    _playerController.initialize().onError((error, stackTrace) {
      isInitControl = _playerController.value.isInitialized;
      print(
          "init error:{error.toString()}+{_controller.value.isInitialized}+");
    });
  }


  Future<bool> init() async {
    await _playerController.play().onError((error, stackTrace) {
      print("play error:{error.toString()}+{url}+");
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        scrollDirection: Axis.vertical,
        onPageChanged: (index) {
          _pageIndex = index;
        },
        controller: _pageController,
        allowImplicitScrolling: false,
        padEnds: true,
        reverse: false,
        children: [
          FutureBuilder<bool>(
              future: init(),
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                if (snapshot.data == true) {
                  isInitControl = _playerController.value.isInitialized;
                  return AspectRatio(
                    //设置视频的大小 宽高比。长宽比表示为宽高比。例如，16:9宽高比的值为16.0/9.0
                    aspectRatio: _playerController.value.aspectRatio,
                    //播放视频的组件
                    child: VideoPlayer(_playerController, key: UniqueKey()),
                  );
                }else{
                  return const Text("视频加载钟");
                }
              }),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.green,
          )
        ],
      ),
    );
  }
}
