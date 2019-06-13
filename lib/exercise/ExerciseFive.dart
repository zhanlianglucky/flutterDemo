import 'package:flutter/material.dart';

///material 首页 点击事件
void main() => runApp(new MaterialApp(
      title: "title",
      home: new HomePageWidget(),
    ));

class HomePageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("homePage title"),
        leading: new IconButton(icon: new Icon(Icons.menu), onPressed: null),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search), onPressed: null)
        ],
      ),
      body: new ContentPageWidget(),
      floatingActionButton: new FloatingActionButton(
        onPressed: null,
        child: new Icon(Icons.add),
      ),
    );
  }
}

///内容 + 按钮点击
class ContentPageWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: (){
        print("click operate");
      },
      child: new Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
//        margin: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
        margin: const EdgeInsets.symmetric().copyWith(top: 24,left: 12,right: 12,bottom: 12),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(5.0),
          color: Colors.lightGreen[500]
        ),
        child: new Center(
          child: new Text("Click"),
        ),
      ),
    );
  }
}
