import 'package:flutter/material.dart';

///滑动删除
void main() => runApp(new MaterialApp(
    title: "slid to delete item",
    home: new Scaffold(
      appBar: new AppBar(
        title: new Text("test slid to delete item"),
        backgroundColor: Colors.green,
      ),
      body: new ListViewWidget(
        list: new List.generate(
          //生成数据
          50, (i) => "item $i",
        ),
      ),
    )));

class ListViewWidget extends StatelessWidget {
  List<String> list;
  ListViewWidget({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          String item = list[index];
          return new Dismissible(
              key: new Key(item),
              // We also need to provide a function that will tell our app
              // what to do after an item has been swiped away.
              onDismissed:(direction){
                list.removeAt(index);
                Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("$item dismissed!")));
              },
              child: new ListTile(
                title: new Text(item),
              ));
        });
  }
}
