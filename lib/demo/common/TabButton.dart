import 'package:flutter/material.dart';

/// 自定义上下结构按钮
class TabButton extends StatefulWidget {
  final VoidCallback callback;
  final String text;
  TabButton({@required this.text,@required this.callback});

  @override
  State<StatefulWidget> createState() => TabButtonState();
}

class TabButtonState extends State<TabButton>{
  Color textColor = Colors.white;
  Color iconColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        widget.callback();
        setState(() {
          textColor = Colors.red;
          iconColor = Colors.red;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.assignment,color: iconColor,),
          Text(widget.text,style: TextStyle(
            color: textColor,
            fontSize: 16
          ),)
        ],

      ),
    );
  }
}