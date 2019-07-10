import 'package:flutter/material.dart';

///material 风格
class MaterialWidget extends StatelessWidget {
  final Widget body;
  final String title;
  MaterialWidget({@required this.title,@required this.body});
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
      ),
    );
  }
}