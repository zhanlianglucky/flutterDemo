import 'package:flutter/material.dart';

///跳转多个页面
void main()=>runApp(new MaterialApp(
  title: "test navigators",
  home: new Scaffold(
    appBar: new AppBar(
      title: new Text("test navigators"),
      backgroundColor: Colors.blue,
    ),
    body: new ContentWidget(listData:new List.generate(11, (i)=> "click into page $i")),
  ),
  routes: <String,WidgetBuilder>{
    '0':(BuildContext context)=>MyPage(info:"page 0"),
    '1':(BuildContext context)=>MyPage(info:"page 1"),
    '2':(BuildContext context)=>MyPage(info:"page 2"),
    '3':(BuildContext context)=>MyPage(info:"page 3"),
    '4':(BuildContext context)=>MyPage(info:"page 4"),
    '5':(BuildContext context)=>MyPage(info:"page 5"),
    '6':(BuildContext context)=>MyPage(info:"page 6"),
    '7':(BuildContext context)=>MyPage(info:"page 7"),
    '8':(BuildContext context)=>MyPage(info:"page 8"),
    '9':(BuildContext context)=>MyPage(info:"page 9"),
    '10':(BuildContext context)=>MyPage(info:"page 10"),
  },
));

class ContentWidget extends StatelessWidget {
  final List<String> listData;
  ContentWidget({@required this.listData});

  @override
  Widget build(BuildContext context) {
    return new Container(
      child:  new ListView.builder(itemBuilder: (context,index){
        return new ListTile(
          title: new Text("${listData[index]}"),
          onTap: (){
            Navigator.pushNamed(context, "$index");//跳转
          },
        );
      }),
    );
  }
}

class MyPage extends StatelessWidget {
  final String info;
  MyPage({this.info});
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("title: $info"),
        backgroundColor: Colors.blue,
      ),
      body: new Center(
        child: new Text("page content： $info"),
      ),
    );
  }
}