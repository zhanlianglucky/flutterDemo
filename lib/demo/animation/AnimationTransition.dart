import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';



//动画和视图组装类
class AnimationTransition extends AnimatedWidget {
  final Widget child;
  final Animation<double> animation;
  AnimationTransition({@required this.child, @required this.animation}):super(listenable:animation);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: animation.value,
      width: animation.value,
      alignment: Alignment.center,
      child: child,
    );
  }
}