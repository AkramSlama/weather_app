import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get-weather-cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_entity.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key, required this.weather}) : super(key: key);
  final WeatherEntity weather;
  @override
  Widget build(BuildContext context) {
    WeatherEntity weatherEntity =
        BlocProvider.of<WeatherCubit>(context).weatherModel!;
    String imgUrl = weatherEntity.image.startsWith('https:')
        ? weatherEntity.image
        : 'https:${weatherEntity.image}';

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
          getThemeColor(weatherEntity.weatherCondition),
          getThemeColor(weatherEntity.weatherCondition)[300]!,
          getThemeColor(weatherEntity.weatherCondition)[50]!
        ], begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weatherEntity.cityName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Text(
                'Updated at ${stringToDataTime(weatherEntity.date).hour}:${stringToDataTime(weatherEntity.date).second}',
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.network(
                    imgUrl,
                  ),
                  Text(
                    weatherEntity.temp,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        weatherEntity.maxTemp,
                        style:
                            const TextStyle(fontSize: 16, fontFamily: 'Ubuntu'),
                      ),
                      Text(
                        weatherEntity.minTemp,
                        style:
                            const TextStyle(fontSize: 16, fontFamily: 'Ubuntu'),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                weatherEntity.weatherCondition,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Ubuntu',
                  fontSize: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

DateTime stringToDataTime(String value) {
  return DateTime.parse(value);
}
