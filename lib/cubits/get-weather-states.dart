import 'package:weather_app/models/weather_entity.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherSuccessState extends WeatherState {
  final WeatherEntity weatherModel;
  WeatherSuccessState(this.weatherModel);
}

class WeatherFailureState extends WeatherState {
  WeatherFailureState(String errMessage);
}
