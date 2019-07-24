import 'package:flutter/material.dart';

/// 利用margin平移
class TestTransitionWidget extends StatefulWidget {
  @override
  _TestTransitionWidgetState createState() => _TestTransitionWidgetState();
}

class _TestTransitionWidgetState extends State<TestTransitionWidget>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Animation move;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    move = EdgeInsetsTween(
      begin: EdgeInsets.only(top: 0.0,right: 0.0),
      end: EdgeInsets.only(top: 50.0,right: 100.0),
    ).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.1,
          0.5,
          curve: Curves.fastOutSlowIn,
        )));
  }

  startAnimation() async {
    await animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        startAnimation();
      },
      child: Container(
        color: Colors.red,
        width: 200.0,
        height: 200.0,
        padding: move.value,
        child: Text("移动",style: TextStyle(
          fontWeight: FontWeight.w300,
          color: Colors.blue,
        ),),

      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController?.dispose();
  }
}
