# Flutter 运行flare设计的动画文件  

* 利用flare工具设计动画
   参考地址:<https://www.2dimensions.com/>  
   
* 将flare生成的以 .nima 结尾的文件导入项目assets目录下  

* 在pubspec.yaml里添加flare依赖  

```
dependencies:
  flutter:
    sdk: flutter
  nima: ^1.0.0
```  

* 在类中导入nima依赖包  

    
    import 'package:nima/nima_actor.dart';  

* 代码调用：

```
    class ContentState extends State<ContentWidget> {
      @override
      Widget build(BuildContext context) {
        return Center(
          child: NimaActor(
            "assets/nm/robot.nima",
            fit: BoxFit.contain,
            animation: "Flight",
          ),
        );
      }
    }  
```  

