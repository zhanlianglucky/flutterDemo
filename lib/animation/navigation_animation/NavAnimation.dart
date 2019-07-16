import 'package:flutter/material.dart';

///页面切换动画 标准hero动画
class PhotoHero extends StatelessWidget {
  final String photo;
  final VoidCallback onTap;
  final double width;
  PhotoHero({this.photo, this.onTap, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(//SizedBox在动画的开始和结束处指定 hero 的大小。
      width: width, //动态切换大小
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent, //使用透明色定义“Material” widget可使图片在飞向目标时看到背景。
          child: InkWell(//InkWell包裹图片，来轻松给源和目标 hero 添加点击事件。
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: BoxFit.contain,//确保图片在转换过程中尽可能大而不改变其长宽比。
            ),
          ),
        ),
      ),
    );
  }
}

var image = "assets/images/template-banner.png";
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: PhotoHero(
        photo: image,
        width: 300.0,
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return PageTwo();
          }));
        },
      ),
    );
  }
}


class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("pageTwo"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        alignment: Alignment.topCenter,
        child: PhotoHero(
          photo: image,
          onTap: (){
            Navigator.pop(context);//弹出
          },
        ),
      ),
    );
  }
}

