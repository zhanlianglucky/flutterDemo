import 'package:flutter/material.dart';

///简单使用画笔
void main() =>
    runApp(new MaterialApp(
      title: "use canvas",
      theme: new ThemeData(primaryColor: Colors.red),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("test canvas"),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: () {},
          child: new Icon(Icons.update),
        ),
        body: new MyPaint(),
      ),
    ));

class MyPaint extends CustomPaint {
  @override
  CustomPainter get painter => new MyPainter();
}


/// 绘制
class MyPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
//    size.width;
//    size.height;
    var paint = Paint()//画笔设置
        ..strokeWidth = 2
        ..color = Colors.red
    ..style = PaintingStyle.fill;

    canvas.drawLine(new Offset(0, 0), new Offset(100, 100), paint);//画线
//    canvas.drawRect(new Rect.fromPoints(new Offset(10, 10), new Offset(100, 100)), paint);// 画区域

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}
