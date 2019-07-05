import 'package:flutter_demo/bean/WeatherInfo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'package:flutter_demo/bean/WeatherData.g.dart';

@JsonSerializable(nullable: false)
class WeatherData{

  WeatherInfo weatherinfo;
  WeatherData({this.weatherinfo});

  factory WeatherData.fromJson(Map<String,dynamic> json)=>_$WeatherDataFromJson(json);
  Map<String,dynamic> toJson()=> _$WeatherDataToJson(this);
}

