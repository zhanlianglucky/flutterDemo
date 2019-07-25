import 'package:flutter/material.dart';

///页面切换动画 标准hero动画
class WidgetHero extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final double width;
  final String tag;
  WidgetHero({@required this.child,@required this.tag,@required  this.onTap,@required  this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(//SizedBox在动画的开始和结束处指定 hero 的大小。
      width: width, //动态切换大小
      height: width,
      child: Hero(
        tag: tag,
        child: Material(
          color: Colors.transparent, //使用透明色定义“Material” widget可使组件在飞向目标时看到背景。
          child: InkWell(//InkWell包裹，来轻松给源和目标 hero 添加点击事件。
            onTap: onTap,
            child: child,
          ),
        ),
      ),
    );
  }
}