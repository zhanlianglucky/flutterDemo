import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// 启动浏览器，打开url
void main() => runApp(new MaterialApp(
      title: "test url",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("url luncher"),
          backgroundColor: Colors.red,
        ),
        body: new ContentWidget(),
      ),
    ));

class ContentWidget extends StatelessWidget {
  _lunchUrl() async {
    const String _url = "http://www.baidu.com";
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      throw "Could not lunch: $_url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new RaisedButton(
          onPressed: (){
            _lunchUrl();
          },
          child: new Text("Lunch Url"),
        ),
      ],
    );
  }
}
