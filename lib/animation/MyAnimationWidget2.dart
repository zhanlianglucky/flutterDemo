import 'package:flutter/material.dart';

///动画视图类 将视图和动画操作分开

class MyAnimationWidget extends AnimatedWidget {
  final Animation<double> animation;

  MyAnimationWidget({this.animation}):super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: animation.value,
        height: animation.value,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          color: Colors.green,
        ),
        child: Text(
          "${animation.value.toInt()}",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}

class MAnimationWidget extends StatefulWidget {
  @override
  _MAnimationWidgetState createState() => _MAnimationWidgetState();
}

class _MAnimationWidgetState extends State<MAnimationWidget>
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
    _animation.addStatusListener((status){
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
//      print("$status");
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if (_animationController.isAnimating){
          _animationController.stop();
        }else {
          _animationController.forward();
        }
      },
        child: MyAnimationWidget(
      animation: _animation,
    ));
  }
}
