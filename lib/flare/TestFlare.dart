import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

/// flare 动画 注意：引入flare_flutter 开头的库文件
void main() => runApp(MaterialApp(
      title: "test flare animation",
      home: Scaffold(
        appBar: AppBar(
          title: Text("flare animation"),
          backgroundColor: Colors.blue,
        ),
        body: ContentWidget(),
      ),
    ));

class ContentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ContentState();
}

class ContentState extends State<ContentWidget> {
  bool isShowOne = true;
  var animation = "animation1";

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          FlareActor(
            "assets/flare/lightButton.flr",
            animation: animation,
            fit: BoxFit.contain,
            callback: (animationName){
              switch(animationName){
                case "animation1":
                  break;
                case "animation2":
                  break;
              }
              print(animationName);
              setState(() {
                if (isShowOne) {
                  animation = "animation2";
                  isShowOne = false;
                } else {
                  animation = "animation1";
                  isShowOne = true;
                }
              });
            },
      ),
    );
  }
}
