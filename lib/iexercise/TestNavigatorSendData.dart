import 'package:flutter/material.dart';

///切换页面并传值
void main()=>runApp(
  new MaterialApp(
    title: "navigator to other page",
    home: ListViewWidget(
      list: new List.generate(30, (i)=> new Content(title: "title $i",content: "This is the $i's content!")),
    ),
  )
);

///数据类
class Content {
  String title,content;
  Content({this.title,this.content});
}

class ListViewWidget extends StatelessWidget {
  final List<Content> list;
  ListViewWidget({this.list});
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Take data to another page!"),
        backgroundColor: Colors.green,
      ),
      body: new ListView.builder(itemBuilder: (context,index){
        return new ListItemWidget(content: list[index],);
      }),
    );
  }
}

///列表页
class ListItemWidget extends StatelessWidget {
  final Content content;
  ListItemWidget({this.content});

  _toOtherPage (BuildContext context) async{
    final Content result = await Navigator.push(context, new MaterialPageRoute(builder: (context)=>new DetailWidget(content: content,)));//发送并等待回传数据

    Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("${result.title}")));
  }
  @override
  Widget build(BuildContext context) {
    return new ListTile(
      onTap: (){
        _toOtherPage(context);
      },
      title: new Text(content.title),
    );
  }
}

///详情页面
class DetailWidget extends StatelessWidget {
  final Content content;
  DetailWidget({@required this.content});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("${content.title}"),
        backgroundColor: Colors.green,
      ),
      body: new Center(
        child: new GestureDetector(
          onTap: (){
            Navigator.pop(context,content);//数据回传
          },
          child: new Text("${content.content}"),
        ),
      ),
    );
  }
}


