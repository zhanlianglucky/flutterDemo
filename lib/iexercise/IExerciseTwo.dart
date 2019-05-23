import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

///创建一个无限循环的列表，并具有点击收藏功能
///入口
void main() => runApp(new ListViewContainer());

//主窗体
class ListViewContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "IExericeTwo",
      home: new ListViewWidget(),
    );
  }
}

//控件
class ListViewWidget extends StatefulWidget {
  createState() => new ListViewState();
}

//视图中所有控件+状态的实际创建类
class ListViewState extends State<ListViewWidget> {
  final _wordPairList = <WordPair>[];
  final _saved = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0); //大字体设置

  Widget _buildListItem(WordPair wordPair) {
    final alreadySaved = _saved.contains(wordPair);
    return new ListTile(
      title: new Text(
        wordPair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
          //添加收藏图标控件
          alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null),
      onTap: () {
        //点击事件
        setState(() {
          //更新控件状态
          if (alreadySaved) {
            _saved.remove(wordPair);
          } else {
            _saved.add(wordPair);
          }
        });
      },
    );
  }

  Widget _buildListView() {
    //创建listview
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0), //设置padding
      itemBuilder: (context, i) {
        if (i.isOdd) {
          //创建分割线
          return new Divider();
        }

        final index = i ~/ 2; //算出当前的item位置
        if (index >= _wordPairList.length) {
          _wordPairList.addAll(generateWordPairs().take(10));
        }
        return _buildListItem(_wordPairList[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //主体
      appBar: new AppBar(
        title: new Text("list collection"),
      ),
      body: _buildListView(),
    );
  }
}
