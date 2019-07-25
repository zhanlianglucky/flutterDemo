import 'dart:math';

import 'package:flutter/material.dart';


///旋转
class RotateAnimationWidget extends StatefulWidget {
  final Widget child;
  final double lowerBound, upperBound;
  final Duration duration;

  RotateAnimationWidget(
      {@required this.lowerBound,
      @required this.upperBound,
      @required this.duration,
      @required this.child});

  @override
  _RotateAnimationWidgetState createState() => _RotateAnimationWidgetState();
}

class _RotateAnimationWidgetState extends State<RotateAnimationWidget>
    with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
        duration: widget.duration,
        lowerBound: widget.lowerBound,
        upperBound: widget.upperBound,)
      ..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: animationController.value * 2.0 * pi,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController?.dispose();
  }
}
