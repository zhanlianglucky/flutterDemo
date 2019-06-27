import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

///测试 websocket 长连接操作
void main() => runApp(new MaterialApp(
  title: "test webSocket",
  home: new Scaffold(
    appBar: new AppBar(
      title: new Text("websocket"),
      backgroundColor: Colors.lightBlue,
    ),
    body: new ContentWidget(),
  ),
));

class ContentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ContentState();
}

class ContentState extends State<ContentWidget>{

  String data = "";
  _getInfoFromWebSocket() async{
    final channel = await IOWebSocketChannel.connect("ws://echo.websocket.org");
    channel.sink.add("hi websocket!");
    channel.stream.listen((message){
      setState(() {
        print(message);
        data = message;
      });
      channel.sink.close(status.goingAway);
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Column(
        children: <Widget>[
          new RaisedButton(onPressed: (){
            _getInfoFromWebSocket();
          },
          child: new Text("获取数据"),
          ),
          new Text(data),
        ],
      ),
    );
  }
}