import 'package:flutter/material.dart';

/// 组合动画

///视图控件
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        color: Colors.green,
      ),
      child: Text(
        "独立控件",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w300,
        ),
      ),
      alignment: Alignment.center,
    );
  }
}

///动画和视图组装类
class AnimationTransition extends AnimatedWidget {
  final MyWidget child;
  final Animation<double> animation;
  AnimationTransition({@required this.child, @required this.animation}):super(listenable:animation);
  static final _opacityTween = new Tween<double>(begin: 0.1, end: 1.0);
  static final _sizeTween = new Tween<double>(begin: 80.0, end: 100.0);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _opacityTween.evaluate(animation),
      child: Container(
        height: _sizeTween.evaluate(animation),
        width: _sizeTween.evaluate(animation),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}

///实际操作类
class MyAnimation4 extends StatefulWidget {
  @override
  _MyAnimation4State createState() => _MyAnimation4State();
}

class _MyAnimation4State extends State<MyAnimation4>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
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
          child: MyWidget(),
          animation: _animation,
        ));
  }
}
