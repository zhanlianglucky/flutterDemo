import 'package:flutter/material.dart';

/// 手势处理
void main()=>runApp(new MaterialApp(
  title: "test Gestrue",
  home: new Scaffold(
    appBar: new AppBar(
      title: new Text("gestrue"),
      backgroundColor: Colors.red,
    ),
    body: new ContentWidget(),
  ),
));

class ContentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ContentState();
}

class ContentState extends State<ContentWidget>{

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Column(
        children: <Widget>[
          new GestureDetector(
            //Tap 事件
            onTap: (){print("onTap");},
            onTapDown:  (event){print("onTapDown: ${event.runtimeType}");},
            onTapUp:  (event){print("onTapUp: ${event.runtimeType}");},
            onTapCancel:  (){print("onTapCancel");},
            onDoubleTap:  (){print("onDoubleTap");},

            //VerticalDrag 事件
            onVerticalDragStart:  (event){print("onVerticalDragStart: ${event.runtimeType}");},
            onVerticalDragEnd:  (event){print("onVerticalDragEnd: ${event.runtimeType}");},
            onVerticalDragUpdate:  (event){print("onVerticalDragUpdate: ${event.runtimeType}");},
            onVerticalDragDown:  (event){print("onVerticalDragDown: ${event.runtimeType}");},
            onVerticalDragCancel:  (){print("onVerticalDragCancel");},

            //HorizontalDrag 事件
            onHorizontalDragStart:  (event){print("onHorizontalDragStart: ${event.runtimeType}");},
            onHorizontalDragEnd:  (event){print("onHorizontalDragEnd: ${event.runtimeType}");},
            onHorizontalDragUpdate:  (event){print("onHorizontalDragUpdate: ${event.runtimeType}");},
            onHorizontalDragDown:  (event){print("onHorizontalDragDown: ${event.runtimeType}");},
            onHorizontalDragCancel:  (){print("onHorizontalDragCancel");},

            //LongPress 事件
            onLongPressStart: (event){print("onLongPressStart: ${event.runtimeType}");},
            onLongPress: (){print("onLongPress");},
            onLongPressMoveUpdate: (event){print("onLongPressMoveUpdate: ${event.runtimeType}");},
            onLongPressUp: (){print("onLongPressUp");},
            onLongPressEnd: (event){print("onLongPressEnd: ${event.runtimeType}");},

            //ForcePress 事件
            onForcePressStart: (event){print("onForcePressStart: ${event.runtimeType}");},
            onForcePressUpdate: (event){print("onForcePressUpdate: ${event.runtimeType}");},
            onForcePressEnd: (event){print("onForcePressEnd: ${event.runtimeType}");},
            onForcePressPeak: (event){print("onForcePressPeak: ${event.runtimeType}");},


            child: new RaisedButton(
                onPressed: (){print("RaisedButton => onPressed");},
              child: new Container(
                padding: new EdgeInsets.all(100),
                child: new Text("drag / click / longPress ..."),
              ),
            ),

          ),
          new Text("在控制台查看触摸事件执行顺序和流程！"),
        ],
      ),
    );
  }
}
