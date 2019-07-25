import 'package:flutter/material.dart';
import 'package:flutter_demo/demo/animation/ScaleAnimation.dart';
import 'package:flutter_demo/demo/animation/ScaleHeroAnimation.dart';
import 'package:flutter_demo/demo/home/CountDetailWidget.dart';
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
        return WidgetHero(
          tag: "GridListItem$i",
          width: 50.0,
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return CountDetailWidget(
                child: getItem(i),
              );
            }));
          },
          child: getItem(i),
        );
      },
    );
  }

  getItem(int index) {
    return ScaleAnimationWidget(
      lowerBound: 0.8,
      upperBound: 1.0,
      duration: Duration(seconds: 1),
      child: GridListItem(
        number: index,
      ),
    );
  }


}
