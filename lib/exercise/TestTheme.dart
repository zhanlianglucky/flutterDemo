import 'package:flutter/material.dart';

///主题样式
void main() => runApp(new MaterialApp(
  title: "test theme",
  theme: new ThemeData(
    brightness: Brightness.dark,//内容部分深色/浅色主题
    primaryColor: Colors.lightBlue[800],
    accentColor: Colors.cyan[600],
  ),
  home: new Scaffold(
    appBar: new AppBar(
      title: new Text("app bar"),
    ),
    body: new Center(
      child: new ContentWidget(),
    ),
  ),
));

/*
Theme.of(context)将查找Widget树并返回树中最近的Theme。
如果我们的Widget之上有一个单独的Theme定义，则返回该值。如果不是，则返回App主题。
 事实上，FloatingActionButton真是通过这种方式找到accentColor的！
 */
class ContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Text(
      'content',
      style: Theme.of(context).textTheme.title,
    );
  }
}
