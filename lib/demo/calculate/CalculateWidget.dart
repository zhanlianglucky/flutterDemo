import 'package:flutter/material.dart';
import 'package:flutter_demo/demo/animation/FadeAnimation.dart';

class CalculateWidget extends StatefulWidget {
  @override
  _CalculateWidgetState createState() => _CalculateWidgetState();
}

class _CalculateWidgetState extends State<CalculateWidget> {
  @override
  Widget build(BuildContext context) {
    return FadeAnimationWidget(
      lowerBound: 0.6,
      upperBound: 1.0,
      duration: Duration(seconds: 1),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          "123",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w900,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}


