// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WeatherData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) {
  return WeatherData(
      weatherinfo:
          WeatherInfo.fromJson(json['weatherinfo'] as Map<String, dynamic>));
}

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{'weatherinfo': instance.weatherinfo};
