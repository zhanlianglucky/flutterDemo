import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

///加载图片资源测试
void main() => runApp(new MaterialApp(
      title: "test assets",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("assets"),
          backgroundColor: Colors.blue,
        ),
        body: new ContentWidget(),
      ),
    ));

class ContentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ContentState();
}

class ContentState extends State<ContentWidget> {
  String imgUrl =
      "https://upload-images.jianshu.io/upload_images/2751425-ad8a132518fa1325.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/664";

  bool isShowCache = false;

  _getImageFromCache() {
    if (isShowCache) {
      return new CachedNetworkImage(
        imageUrl: imgUrl,
        placeholder: new CircularProgressIndicator(),
        errorWidget: new Icon(Icons.error),
      );
    }
    return new Text("点击上部按钮");
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Column(
        children: <Widget>[
          new Image(
            //本地图片
            image: new AssetImage("assets/images/template-banner.png"),
          ),
          new Divider(),
          //网络图片
          new Image.network(imgUrl),
          new Divider(),
          new RaisedButton(
            onPressed: () {
              setState(() {
                isShowCache = !isShowCache;
              });
            },
            child: new Text("点击加载缓存图片"),
          ),
          _getImageFromCache(),
        ],
      ),
    );
  }
}
