import 'package:flutter/material.dart';
import 'package:flutter_demo/animation/navigation_animation/NavAnimation2.dart' as NavAnimation2;

///执行入口
void main()=>runApp(MaterialApp(
  title: "test animation",
  home: Scaffold(
    appBar: AppBar(
      title: Text("animation test"),
      backgroundColor: Colors.green,
    ),
//    body: NavAnimation.FirstPage(),
    body: NavAnimation2.RadialExpansionDemo(),
  ),
));