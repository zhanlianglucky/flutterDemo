import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

///程序入口 继续扩展之前的功能 做一个列表+收藏和取消收藏功能
void main() => runApp(new MyApp());

///主体框架
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'ExerciseFour',
      home: new RandomWords(),
    );
  }
}

///文字展示控件
class RandomWords extends StatefulWidget {
  createState() => new RandomWordsState();
}

///状态变更控件
class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[]; //新建数组，在Dart语言中使用下划线前缀标识符，会强制其变成私有的。
  final _saved = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0); //大字体设置

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(20), //设置padding
        itemBuilder: (context, i) {
          //创建item
          if (i.isOdd) return new Divider(); //判断奇数返回分割线

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair wordPair) {
    //创建单条数据
    final alreadySaved = _saved.contains(wordPair); //判断单词是否已经添加

    return new ListTile(
      title: new Text(
        wordPair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
          //添加收藏图标控件
          alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null
      ),
      onTap: (){//点击事件
        setState(() {//更新控件状态
          if (alreadySaved){
            _saved.remove(wordPair);
          }else {
            _saved.add(wordPair);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("show list"),
      ),
      body: _buildSuggestions(),
    );
  }
}
