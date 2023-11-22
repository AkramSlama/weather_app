import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get-weather-states.dart';
import 'package:weather_app/models/weather_entity.dart';
import 'package:weather_app/models/weather_model/weather_model.dart';

import 'package:weather_app/services/weather-service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitialState());
   WeatherEntity? weatherModel;

  getWeather({required String cityName}) async {
    emit(WeatherLoadingState());
    try {
      weatherModel =
      await WeatherService(Dio()).getCurrentWeather(cityName: cityName,);
      emit(WeatherSuccessState(weatherModel!));
    } on Exception catch (e) {
      emit(WeatherFailureState(e.toString()));
    }
  }
}
