import 'package:flutter/material.dart';
import 'package:flutter_demo/demo/animation/ScaleHeroAnimation.dart';

class CountDetailWidget extends StatelessWidget {
  final Widget child;
  CountDetailWidget({@required this.child});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("count detail"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        alignment: Alignment.topCenter,
        child: WidgetHero(
          tag: "CountDetailWidget",
          width: 100.0,
          child: child,
          onTap: (){
            Navigator.pop(context);//弹出
          },
        ),
      ),
    );
  }
}