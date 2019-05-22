import 'package:flutter/material.dart';

/// 首次编码实现简单点击文字变更功能

/// 程序入口
void main() => runApp(SampleApp()); // => 方法调用形式，等价于 { }

/// application内容
class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ExerciseOne",
      theme: ThemeData(
          //主体样式
          primarySwatch: Colors.red),
      home: SampleAppContent(), //内容
    );
  }
}

/// 主体内容
class SampleAppContent extends StatefulWidget {
  SampleAppContent({Key key}) : super(key: key);

  @override
  SuperAppContentState createState() => SuperAppContentState();
}

///状态类
class SuperAppContentState extends State<SampleAppContent> {
  bool toggle = true; //变量，用来动态更新显示数据

  void _toggle() {
    setState(() {
      //此方法被调用时，会自动调用下方的build方法
      toggle = !toggle;
    });
  }

  _getToggleChild() {
    if (toggle) {
      return Text('Toggle One');
    } else {
      return MaterialButton(onPressed: () {}, child: Text('Toggle Two'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //标题
      appBar: AppBar(
        title: Text("Sample App"),
      ),
      //布局和内容
      body: Center(
        child: _getToggleChild(),
      ),
      //悬浮按钮
      floatingActionButton: FloatingActionButton(
        onPressed: _toggle, //点击事件
        tooltip: 'Update Text',
        child: Icon(Icons.update), //按钮样式
      ),
    );
  }
}
