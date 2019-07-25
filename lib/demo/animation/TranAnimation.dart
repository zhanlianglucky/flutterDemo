import 'package:flutter/material.dart';
import 'package:flutter_demo/demo/animation/AnimationTransition.dart';

///移动
class TranAnimationWidget extends StatefulWidget {
  final Widget child;
  TranAnimationWidget({this.child});
  @override
  _TranAnimationWidgetState createState() => _TranAnimationWidgetState();
}

class _TranAnimationWidgetState extends State<TranAnimationWidget>
    with TickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    _animationController.forward();
    _animation.addStatusListener((status) {
      setState(() {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });
      print("$status");
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (_animationController.isAnimating) {
            _animationController.stop();
          } else {
            _animationController.forward();
          }
        },
        child: AnimationTransition(
          child: widget.child,
          animation: _animation,
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController?.dispose();
  }
}
