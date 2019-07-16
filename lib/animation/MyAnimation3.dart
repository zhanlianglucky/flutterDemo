import 'package:flutter/material.dart';

/// 代码结构调整：将动画和视图完全分离， 动画可以展示多种不同的视图，可以方便的定制统一动画

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

///实际操作类
class MyAnimation3 extends StatefulWidget {
  @override
  _MyAnimation3State createState() => _MyAnimation3State();
}

class _MyAnimation3State extends State<MyAnimation3>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    _animation = Tween(begin: 80.0, end: 100.0).animate(_animationController);
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
