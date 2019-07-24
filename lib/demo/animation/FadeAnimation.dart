import 'package:flutter/material.dart';

class FadeAnimationWidget extends StatefulWidget {
  final Widget child;
  final double lowerBound,upperBound;
  final Duration duration;
  FadeAnimationWidget({@required this.lowerBound,@required this.upperBound,@required this.duration,@required this.child});
  @override
  _FadeAnimationWidgetState createState() => _FadeAnimationWidgetState();
}

class _FadeAnimationWidgetState extends State<FadeAnimationWidget>
    with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
    AnimationController(vsync: this, duration: widget.duration,lowerBound: widget.lowerBound,upperBound:widget.upperBound)
      ..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: animationController,child: widget.child,);
  }

  @override
  void dispose() {
    super.dispose();
    animationController?.dispose();
  }

}