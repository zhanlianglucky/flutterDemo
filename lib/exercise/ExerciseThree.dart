import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

///程序入口 继续扩展之前的功能 做一个列表
void main() => runApp(new MyApp());

///主体框架
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'ExerciseThree',
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
  //final 修饰符的作用可以参考 https://www.jianshu.com/p/91c2511d104f
  final _suggestions = <WordPair>[]; //新建数组，在Dart语言中使用下划线前缀标识符，会强制其变成私有的。
  final _biggerFont = const TextStyle(fontSize: 18.0); //大字体设置

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(20), //设置padding
        itemBuilder: (context, i) {
          //创建item
          if (i.isOdd) return new Divider(); //判断奇数返回分割线

          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
          // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            //如果到底就再添加10个item
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair wordPair) {//创建单条数据
    return new ListTile(
      title: new Text(
        wordPair.asPascalCase,
        style: _biggerFont,
      ),
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
