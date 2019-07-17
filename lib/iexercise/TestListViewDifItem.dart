import 'package:flutter/material.dart';

///不同条目的listview

void main() => runApp(new MaterialApp(
  title: "test listview",
  home: new Scaffold(
    appBar: new AppBar(
      title: new Text("different item in listview!"),
      backgroundColor: Colors.lightBlue,
    ),
    body: new ListViewWidget(
      list: new List.generate(
          1200,
              (i)=>i%6==0? new HeadItemData(head: "head $i/6"):new ContentItemData(title:"title $i",content: "content $i"),
    ),
  ),
)));

abstract class ItemData{}
class HeadItemData extends ItemData{
  String head;
  HeadItemData({this.head});
}
class ContentItemData extends ItemData {
 final String title,content;
  ContentItemData({this.title,this.content});
}

class ListViewWidget extends StatefulWidget {
  final List<ItemData> list;
  ListViewWidget({this.list});
  @override
  State<StatefulWidget> createState() => new ListViewState();
}

class ListViewState extends State<ListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (context, index) {
          ItemData item = widget.list[index];
          if (item is HeadItemData){
            return new ListTile(
              title: new Text(item.head,style: Theme.of(context).textTheme.headline,),
            );
          } else if (item is ContentItemData){
            return new ListTile(
              title: new Text(item.title,),
              subtitle: new Text(item.content),
            );
          } else {
            return new ListTile(
              title: new Text("invalid"),
            );
          }
        });
  }
}
