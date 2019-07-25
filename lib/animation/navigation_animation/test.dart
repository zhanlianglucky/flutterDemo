import 'package:flutter/material.dart';
import 'package:flutter_demo/animation/navigation_animation/NavAnimation.dart' as NavAnimation;

///执行入口
void main()=>runApp(MaterialApp(
  title: "test animation",
  home: Scaffold(
    appBar: AppBar(
      title: Text("animation test"),
      backgroundColor: Colors.green,
    ),
    body: NavAnimation.FirstPage(),
//    body: NavAnimation2.RadialExpansionDemo(),
  ),
));