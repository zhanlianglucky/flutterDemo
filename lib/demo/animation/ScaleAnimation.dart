import 'package:flutter/material.dart';

/// 缩放
class ScaleAnimationWidget extends StatefulWidget {
  final Widget child;
  final double lowerBound, upperBound;
  final Duration duration;

  ScaleAnimationWidget(
      {@required this.lowerBound,
      @required this.upperBound,
      @required this.duration,
      @required this.child});

  @override
  _ScaleAnimationWidgetState createState() => _ScaleAnimationWidgetState();
}

class _ScaleAnimationWidgetState extends State<ScaleAnimationWidget>
    with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
        duration: widget.duration,
        lowerBound: widget.lowerBound,
        upperBound: widget.upperBound)
      ..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animationController,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController?.dispose();
  }
}
