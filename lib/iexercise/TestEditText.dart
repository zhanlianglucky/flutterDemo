import 'package:flutter/material.dart';

/// 输入框
void main() => runApp(new MaterialApp(
      title: "test EditText",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("EditText"),
          backgroundColor: Colors.red,
        ),
        body: new ContentWidget(),
      ),
    ));

class ContentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ContentState();
}

class ContentState extends State<ContentWidget> {
  String str = "";

  TextEditingController controller = new TextEditingController();
  TextEditingController _getController() {
    controller.addListener((){//监听输入
      setState(() {
        str = controller.text;//输入框内容
      });
    });
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Column(
        children: <Widget>[
          new TextField(
            textAlign: TextAlign.right,
            decoration: new InputDecoration(labelText: "请输入内容"),
            controller: _getController(),
          ),
          new Text("输入框的内容：$str"),
        ],
      ),
    );
  }
}
