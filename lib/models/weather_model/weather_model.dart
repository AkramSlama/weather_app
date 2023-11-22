import 'package:weather_app/models/weather_entity.dart';
import 'current.dart';
import 'forecast.dart';
import 'location.dart';

class WeatherModel extends WeatherEntity {
  Location? location;
  Current? current;
  Forecast? forecast;

  WeatherModel({this.location, this.current, this.forecast}) : super(
      cityName: location!.name ?? 'Unknown',
      date: current!.lastUpdated ?? 'Unknown',
      temp: '${forecast!.forecastday!.first.day!.avgtempC?.round() ?? 'Unknown'}',
      maxTemp: '${forecast.forecastday!.first.day!.maxtempC?.round() ?? 'Unknown'}',
      minTemp: '${forecast.forecastday!.first.day!.mintempC ?.round()?? 'Unknown'}',
     image: 'https:${current.condition?.icon}',
    weatherCondition:  current.condition?.text??'Unknown' ,
  );

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        location: json['location'] == null
            ? null
            : Location.fromJson(json['location'] as Map<String, dynamic>),
        current: json['current'] == null
            ? null
            : Current.fromJson(json['current'] as Map<String, dynamic>),
        forecast: json['forecast'] == null
            ? null
            : Forecast.fromJson(json['forecast'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'location': location?.toJson(),
        'current': current?.toJson(),
        'forecast': forecast?.toJson(),
      };
}
