import 'package:flutter/material.dart';

/// test canvas
void main() => runApp(new AppWidget());

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "test canvas",
      theme: new ThemeData(primaryColor: Colors.red),
      home: new HomePageWidget(),
    );
  }
}

class HomePageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("use canvas"),
      ),
      body: new SignatureWidget(),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {},
        child: new Icon(Icons.update),
      ),
    );
  }
}

class SignatureWidget extends StatefulWidget {
  State<StatefulWidget> createState() => new SignatureState();
}

class SignatureState extends State<SignatureWidget> {
  List<Offset> _points = <Offset>[];

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onPanUpdate: (DragUpdateDetails detail) {
        setState(() {
          RenderBox renderBox = context.findRenderObject();
          Offset localPosition = renderBox.globalToLocal(detail.globalPosition);
          _points = new List.from(_points)..add(localPosition);
        });
      },
      onPanEnd: (DragEndDetails detail) => _points.add(null),
      child: new CustomPaint(
        painter: new SignaturePainter(_points),
      ),
    );
  }
}

/// 画笔
class SignaturePainter extends CustomPainter {
  final List<Offset> points;

  SignaturePainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(SignaturePainter otherPainter) =>
      otherPainter.points != points;
}
