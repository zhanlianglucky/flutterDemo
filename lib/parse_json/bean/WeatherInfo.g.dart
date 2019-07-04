// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WeatherInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherInfo _$WeatherInfoFromJson(Map<String, dynamic> json) {
  return WeatherInfo(
      city: json['city'] as String,
      cityid: json['cityid'] as String,
      temp1: json['temp1'] as String,
      temp2: json['temp2'] as String,
      weather: json['weather'] as String,
      ptime: json['ptime'] as String);
}

Map<String, dynamic> _$WeatherInfoToJson(WeatherInfo instance) =>
    <String, dynamic>{
      'city': instance.city,
      'cityid': instance.cityid,
      'temp1': instance.temp1,
      'temp2': instance.temp2,
      'weather': instance.weather,
      'ptime': instance.ptime
    };
