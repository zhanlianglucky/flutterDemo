import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///flutter 跟android原生交互
class BatteryState extends State {
  String batteryInfo = "";
  static const methodChannel = const MethodChannel('com.flutter.io/battery');//通道服务

  Future<Null> _getBatterInfoFromAndroid() async{
    String temp = "";
    try{
      int result = await methodChannel.invokeMethod('getBatteryInfo');//加载方法
      temp = "$result";
    } on PlatformException catch(e){//捕获异常
      temp = "Failed to get battery info::${e.message}";
    }
    setState(() {
      batteryInfo = "bantteryInfo:$temp";
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child:  new Column(
        children: <Widget>[
          new Text(batteryInfo),
          new RaisedButton(
            onPressed: () {
              _getBatterInfoFromAndroid();
            },
            child: new Text("show android battery info"),
            padding: new EdgeInsets.all(10),
          ),
        ],
      ),
    );
  }
}
