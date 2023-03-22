import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  static const platform = MethodChannel('samples');//通道名称初始化
  String _batteryLevel = 'Unknown battery level.';

  //异步任务，通过平台通道与特定平台进行通信，获取原生代码中获取电量部分的代码，这里的宿主平台是 Android
  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = '电量为：$result % .';
    } on PlatformException catch (e) {
      batteryLevel = "获取电量失败: '${e.message}'.";
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: _getBatteryLevel,
            child: const Text('获取电量'),
          ),
          Text(_batteryLevel),
        ],
      ),
    );
  }

}
