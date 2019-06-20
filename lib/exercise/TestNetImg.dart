import 'package:flutter/material.dart';
//import 'package:cached_network_image/cached_network_image.dart'; //带缓存功能的图片展示

/// 展示远程图片
void main() => runApp(new MaterialApp(
  title: "test net img",
  home: new Scaffold(
    appBar: new AppBar(
      title: new Text("net img"),
    ),
    body: new Center(
      child: new NetImgWidget(),
    ),
  ),
));

///远程图片
class NetImgWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Text("This img comes from the internet!",),
        new Image.network(
            "https://img-blog.csdn.net/20180405160945517?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0tpdGFpYmVs/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70"
        )
      ],
    );
  }
}
