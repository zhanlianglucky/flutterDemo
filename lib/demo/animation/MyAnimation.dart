import 'package:flutter/material.dart';

///动画
class MyAnimation extends StatefulWidget {
  @override
  _MyAnimationState createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    _animation = Tween(begin: 40.0, end: 200.0).animate(_animationController)
      ..addListener(() {
        setState(() {
          /////

        });
      });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: (){
          if (_animationController.isAnimating){
            _animationController.stop();
          } else {
            _animationController.repeat();
          }
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.amber,
          ),
          margin: EdgeInsets.all(10.0),
          height: _animation.value,
          width: _animation.value,
          child: Icon(Icons.android,color: Colors.blue[400],size: _animation.value/2,),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

}
