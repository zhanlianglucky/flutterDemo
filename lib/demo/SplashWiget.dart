import 'package:flutter/material.dart';

///启动页
class SplashWidget extends StatelessWidget {
  _getImageWidget() {
    return Image.asset(
      "assets/images/template-banner.png",
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.fill,//铺满
    );
  }
  //初始化
  _init(BuildContext context){
    Future.delayed(Duration(seconds: 3),(){
      Navigator.of(context).pushReplacementNamed("/home");
      print("future delayed");
    });
  }

  @override
  Widget build(BuildContext context) {
    _init(context);
    return _getImageWidget();
  }
}
