import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

///websocket demo
void main()=> runApp(new MaterialApp(
  title: "test websocket",
  home: new Scaffold(
    appBar: new AppBar(
      title: new Text("websocket"),
      backgroundColor: Colors.red,
    ),
    body: new ContentWidget(channel: IOWebSocketChannel.connect("ws://echo.websocket.org"),),
  ),
));

class ContentWidget extends StatefulWidget {
  WebSocketChannel channel;
  ContentWidget({this.channel});
  @override
  State<StatefulWidget> createState() => new ContentState();
}

class ContentState extends State<ContentWidget>{
  TextEditingController _textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Column(
        children: <Widget>[
          new Form(
            child: new TextFormField(
              controller: _textEditingController,
              decoration: new InputDecoration(
                labelText: "input send data"
              ),
            ),
          ),
          new StreamBuilder(//服务返回的信息
            stream: widget.channel.stream,
            builder: (context,snapshot){
              return new Text(snapshot.hasData?"received msg: ${snapshot.data}":"");
            },
          ),
          new FloatingActionButton(onPressed: (){
            _sendData(_textEditingController.text);
          },
            child: new Icon(Icons.send),
          ),
        ],
      ),
    );
  }

  //发送的信息
  void _sendData(String data){
    if (widget.channel != null && data.isNotEmpty){
      widget.channel.sink.add(data);
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.channel != null){
      widget.channel.sink.close();
    }
  }

}

