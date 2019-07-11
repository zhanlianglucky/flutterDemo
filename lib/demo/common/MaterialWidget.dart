import 'package:flutter/material.dart';

///material 风格
class MaterialWidget extends StatelessWidget {
  final Widget body;
  final String title;
  final BottomNavigationBar bottomNavigationBar;
  MaterialWidget({@required this.title,@required this.body,this.bottomNavigationBar});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "demo",
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: body,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}