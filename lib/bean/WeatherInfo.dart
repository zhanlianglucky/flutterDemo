import 'package:json_annotation/json_annotation.dart';

/**
    使用_watcher_可以使我们的源代码生成的过程更加方便。它会监视我们项目中文件的变化，并在需要时自动构建必要的文件。我们可以通过
        flutter packages pub run build_runner watch
    在项目根目录下运行来启动_watcher_。
    只需启动一次观察器，然后并让它在后台运行，这是安全的。
 * **/

part 'package:flutter_demo/bean/WeatherInfo.g.dart';// WeatherInfo为文件名称 将在我们运行生成命令后自动生成 ,此处报错很正常！

@JsonSerializable(nullable: false) //这个标注是告诉生成器，这个类是需要生成Model类的

///天气信息 推荐这种序列化json方式
class WeatherInfo {
//  @JsonKey(name: 'registration_date_millis')//修改key名称
//  final int registrationDateMillis;
  String city,cityid,temp1,temp2,weather,ptime;
  WeatherInfo({this.city,this.cityid,this.temp1,this.temp2,this.weather,this.ptime});

  factory WeatherInfo.fromJson(Map<String,dynamic> json)=>_$WeatherInfoFromJson(json);
  Map<String,dynamic> toJson()=>_$WeatherInfoToJson(this);

}