import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

///程序入口
void main() => runApp(new MyApp());

///主体框架
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    WordPair wordPair = new WordPair.random();
    return new MaterialApp(
      title: 'ExerciseTwo',
      home: new Scaffold(
        appBar: new AppBar(title: new Text('exercise two')),
        body: new Center(
//          child: new Text('Hello World!'),
//          child: new Text(wordPair.asPascalCase),
          child: new RandomWords(),
        ),
      ),
    );
  }
}

///文字展示控件
class RandomWords extends StatefulWidget {
 createState() => new RandomWordsState();
}

///状态变更控件
class RandomWordsState extends State<RandomWords>{
  @override
  Widget build(BuildContext context) {
    WordPair wordPair = new WordPair.random();
    return new Text(wordPair.asPascalCase);
  }
}
