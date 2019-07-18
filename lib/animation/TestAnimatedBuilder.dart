import 'dart:math';

import 'package:flutter/material.dart';


/// 用 AnimatedBuilder 构建动画每次视图刷新，不会重绘动画
void main() =>
    runApp(MaterialApp(
      title: "animated builder",
      home: Scaffold(
        appBar: AppBar(
          title: Text("animated builder"),
        ),
        body: ContentWidget(),
      ),
    ));

class ContentWidget extends StatefulWidget {
  @override
  _ContentWidgetState createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
    AnimationController(vsync: this, duration: Duration(seconds: 3))
      ..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder( //用builder每次视图刷新，不会重绘动画
      animation: _animationController,
      child: Center(
        child: Container(
          width: 50,
          height: 50,
          color: Colors.green,
        ),
      ),
      builder: (BuildContext context, Widget child) {
        return Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.symmetric(vertical: 10.0),),
            _getFadeTransition(child),
            Padding(padding: EdgeInsets.symmetric(vertical: 10.0),),
            _getTransformAnimation(child),
            Padding(padding: EdgeInsets.symmetric(vertical: 10.0),),
            _getScaleTransitionTransition(child),
            Padding(padding: EdgeInsets.symmetric(vertical: 10.0),),
            _getAlignTransition(child),
            Padding(padding: EdgeInsets.symmetric(vertical: 10.0),),
            _getSlideTransition(child),
            Padding(padding: EdgeInsets.symmetric(vertical: 10.0),),
            _getSizeTransition(child),
          ],
        );
      },
    );
  }

  ///大小动画
  _getSizeTransition(Widget child) {
    return SizeTransition(sizeFactor: _animationController, child: child,);
  }

  ///平移动画
  _getSlideTransition(Widget child) {
    Animation<Offset> animation = Tween(begin: Offset.fromDirection(0),end: Offset.fromDirection(2)).animate(_animationController);
    return SlideTransition(position: animation, child: child,);
  }

  ///平移动画
  _getAlignTransition(Widget child) {
    Animation<AlignmentGeometry> animation = AlignmentGeometryTween(
        begin: AlignmentDirectional(0, 0),
        end: AlignmentDirectional(1.0, 1.0)).animate(_animationController);
    return AlignTransition(alignment: animation, child: child,);
  }

  ///伸缩动画
  _getScaleTransitionTransition(Widget child) {
    return ScaleTransition(scale: _animationController, child: child,);
  }

  ///渐变动画
  _getFadeTransition(Widget child) {
    return FadeTransition(opacity: _animationController, child: child,);
  }

  ///旋转动画
  _getTransformAnimation(Widget child) {
    return Transform.rotate(
        child: child, angle: _animationController.value * 2.0 * pi);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController?.dispose();
  }
}
