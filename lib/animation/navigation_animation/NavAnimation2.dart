import 'dart:math';

import 'package:flutter/material.dart';

/// radial动画


// ignore: must_be_immutable
class RadialExpansionDemo extends StatelessWidget {
  static const double kMinRadius = 32.0;
  static const double kMaxRadius = 128.0;
   double _timeDilation;
  static const opacityCurve = const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);

  static RectTween _createRectTween(Rect begin, Rect end) {
    return MaterialRectCenterArcTween(begin: begin, end: end);
  }

  static Widget _buildPage(BuildContext context, String imageName, String description) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: Center(
        child: Card(
          elevation: 8.0,//卡片高度
          child: Column(
            mainAxisSize: MainAxisSize.min,//图片框大小限制
            children: [
              SizedBox(// 动态视图  宽高动态变化
                width: kMaxRadius * 2.0,
                height: kMaxRadius * 2.0,
                child: Hero(//终点：动画结束后视图
                  createRectTween: _createRectTween,
//                  flightShuttleBuilder:( //动画开始到动画结束，过程中的覆盖层视图。默认没有
//                      BuildContext flightContext,
//                      Animation<double> animation,
//                      HeroFlightDirection flightDirection,
//                      BuildContext fromHeroContext,
//                      BuildContext toHeroContext,){
//                    return Container(
//                    width: kMaxRadius*2.0,
//                      height: kMaxRadius*2.0,
//                      color: Colors.red,
//                    );
//                  } ,
//                placeholderBuilder: (//动画结束后的目标页覆盖层视图，一闪而过，结束动画
//                    BuildContext context,
//                    Size heroSize,
//                    Widget child,){
//                    return Container(
//                      width: kMaxRadius*2.0,
//                      height: kMaxRadius*2.0,
//                      color: Colors.deepPurpleAccent,
//                    );
//                },
                  tag: imageName,
                  child: RadialExpansion(//图片裁剪动画，跟起点视图基本对称
                    maxRadius: kMaxRadius,
                    child: Photo(//图片视图，跟起点视图基本对称
                      photo: imageName,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ),
              Text(
                description,
                style: TextStyle(fontWeight: FontWeight.bold),
                textScaleFactor: 3.0,
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHero(BuildContext context, String imageName, String description) {
    return Container(
      width: kMinRadius * 2.0,
      height: kMinRadius * 2.0,
      child: Hero(//起点：连接（移动）动画
        createRectTween: _createRectTween,
        tag: imageName,
        child: RadialExpansion(//图片裁剪动画
          maxRadius: kMaxRadius,
          child: Photo(//图片视图
            photo: imageName,
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder<void>(
                  pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                    return AnimatedBuilder(
                        animation: animation,
                        builder: (BuildContext context, Widget child) {
                          return Opacity(
                            opacity: opacityCurve.transform(animation.value),//透明度变化
                            child: _buildPage(context, imageName, description),
                          );
                        }
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _timeDilation = 5.0; // 1.0 is normal animation speed.

    return  Container(
        padding: const EdgeInsets.all(32.0),
        alignment: FractionalOffset.bottomLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildHero(context, 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1457704519,3529830056&fm=27&gp=0.jpg', 'Chair'),
            _buildHero(context, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=15576430,1042561804&fm=27&gp=0.jpg', 'Binoculars'),
            _buildHero(context, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=180868167,273146879&fm=27&gp=0.jpg', 'Beach ball'),
          ],
        ),
    );
  }
}


class Photo extends StatelessWidget {
  final String photo;
  final Color color;
  final VoidCallback onTap;
  Photo({this.photo, this.color, this.onTap,});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor.withOpacity(0.25),
      child: InkWell(
        onTap: onTap,
        child: Image.network(
          photo,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class RadialExpansion extends StatelessWidget {
  final double maxRadius;
  final double clipRectSize;
  final Widget child;
  RadialExpansion({
    Key key,
    this.maxRadius,
    this.child,
  }) : clipRectSize = 2.0 * (maxRadius / sqrt2),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Center(
        child: SizedBox(
          width: clipRectSize,
          height: clipRectSize,
          child: ClipRect(
            child: child,
          ),
        ),
      ),
    );
  }

}
