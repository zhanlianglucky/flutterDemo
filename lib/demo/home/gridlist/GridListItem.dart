import 'package:flutter/material.dart';

///item
class GridListItem extends StatefulWidget {
  int number;
  GridListItem({@required this.number});
  @override
  State<StatefulWidget> createState() => GridListItemState();
}

class GridListItemState extends State<GridListItem> {
  Color _color = Colors.blue[400];
  int tempNumber;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
//      onTap: (){
//        setState(() {
//          widget.number += 1;
//        });
//      },
//      onTapDown: (d){
//        setState(() {
//          _color = Colors.blue;
//        });
//      },
//      onTapUp: (u){
//        setState(() {
//          _color = Colors.blue[400];
//        });
//      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadiusDirectional.all(Radius.circular(10.0)),
          boxShadow: [//阴影
            BoxShadow(
              color: Colors.black87,
              spreadRadius: 1.0,
            ),
            BoxShadow(
              color: Colors.blue,
              spreadRadius: 2.0,
              blurRadius: 3.0,
            ),
          ],
          color: _color,
        ),
        alignment: Alignment.center,
        child: Text("${widget.number+1}",style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),),
      ),
    );
  }
}
