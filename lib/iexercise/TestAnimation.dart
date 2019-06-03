import 'package:flutter/material.dart';

/// logo 渐入动画
void main() => runApp(new SampleApp());

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Animation",
      theme: ThemeData(primaryColor: Colors.red),
      home: new HomePageWidget(title: "fade animation",),
    );
  }
}

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() => new HomePageState();
}

class HomePageState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;
  CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 2 * 1000),
      vsync: this,
    );
    _curvedAnimation =
        new CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Container(
          child: new FadeTransition(
            opacity: _curvedAnimation,
            child: new FlutterLogo(
              size: 100.0,
            ),
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: "fade",
        child: new Icon(Icons.brush),
        onPressed: () {
          _controller.forward();
        },
      ),
    );
  }
}
