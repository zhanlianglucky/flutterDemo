import 'package:flutter/material.dart';

///首页内容
class HomeContentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeContentState();
}

class HomeContentState extends State<HomeContentWidget> {
  int info = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text("$info"),
          RaisedButton(
            child: Text("+"),
            color: Colors.blue,
            onPressed: (){
              setState(() {
                info++;
              });
            },
          ),
        ],
      ),
    );
  }
}