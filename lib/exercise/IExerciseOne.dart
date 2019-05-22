import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

///做一个列表

///程序入口
void main() => runApp(new ListApp());

/// 列表框架
class ListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "IExerciseOne",
      home: new ListContentWidget(),
    );
  }
}

///列表内容
class ListContentWidget extends StatefulWidget {
  @override
  createState() => new ListWidgetState();
}

///动态列表状态 需要传入一个列表控件对象
class ListWidgetState extends State<ListContentWidget> {
  @override
  Widget build(BuildContext context) {
    //创建组件
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("i list"),
      ),
      body: _buildListWidget(),
    );
  }

  final _listData = <WordPair>[]; //数据
  final _biggerFont = const TextStyle(fontSize: 16.0);

  //创建listView
  Widget _buildListWidget() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16), //设置padding
        itemBuilder: (context, i) {
          //创建items
          //处理item和边线的逻辑
          if (i.isOdd) return new Divider(); //奇数画分割线
          final int position = i ~/ 2; //计算实际的item位置
          if (position >= _listData.length) {
            _listData.addAll(generateWordPairs().take(10)); //每次到底增加10条
          }
          return _buildListItemWidget(_listData[position]);
        });
  }

  Widget _buildListItemWidget (WordPair wordPair) {//创建Item控件
    return new ListTile(
      title: new Text(
        wordPair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }


}
