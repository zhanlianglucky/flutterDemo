import 'package:flutter/material.dart';
import 'package:nima/nima_actor.dart';

/// 初级的播放动画文件 nima动画
void main() => runApp(MaterialApp(
      title: "flare first",
      home: Scaffold(
        appBar: AppBar(
          title: Text("show nima file"),
          backgroundColor: Colors.deepOrange,
        ),
        body: ContentWidget(),
      ),
    ));

class ContentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ContentState();
}

class ContentState extends State<ContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: NimaActor(
        "assets/nima/robot.nima",
        fit: BoxFit.contain,
        animation: "Flight",
      ),
    );
  }
}
