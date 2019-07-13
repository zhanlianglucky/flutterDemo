import 'package:flutter/material.dart';
import 'package:flutter_demo/demo/home/gridlist/GridListItem.dart';

/// 表格
class GridListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GridListState();
}

class GridListState extends State<GridListWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: 18,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,

      ),
      itemBuilder: (context, i) {
        return GridListItem(
          number: i,
        );
      },
    );
  }
}
