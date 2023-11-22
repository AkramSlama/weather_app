import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get-weather-cubit.dart';
import 'package:weather_app/cubits/get-weather-states.dart';
import 'package:weather_app/views/home-view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: Builder(
          builder: (context) =>
              BlocBuilder<WeatherCubit, WeatherState>(
                builder: (context, state) {
                  return MaterialApp(
                    theme: ThemeData(
                      primarySwatch: getThemeColor(
                        BlocProvider
                            .of<WeatherCubit>(
                          context,
                        )
                            .weatherModel
                            ?.weatherCondition,
                      ),
                    ),
                    debugShowCheckedModeBanner: false,
                    home: const HomeView(),
                  );
                },
              )
      ),
    );
  }
}


MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
      return Colors.yellow;
    case 'Clear':
      return Colors.orange;
    case 'Partly cloudy':
      return Colors.deepOrange;
    case 'Cloudy':
      return Colors.grey;
    case 'Overcast':
      return Colors.blueGrey;
    case 'Mist':
      return Colors.blueGrey;
    case 'Patchy rain possible':
      return Colors.lightBlue;
    case 'Patchy snow possible':
      return Colors.lightBlue;
    case 'Patchy sleet possible':
      return Colors.lightBlue;
    case 'Patchy freezing drizzle possible':
      return Colors.lightBlue;
    case 'Thundery outbreaks possible':
      return Colors.deepPurple;
    case 'Blowing snow':
      return Colors.grey;
    case 'Blizzard':
      return Colors.grey;
    case 'Fog':
      return Colors.blueGrey;
    case 'Freezing fog':
      return Colors.blueGrey;
    case 'Patchy light drizzle':
      return Colors.lightBlue;
    case 'Light drizzle':
      return Colors.lightBlue;
    case 'Freezing drizzle':
      return Colors.lightBlue;
    case 'Heavy freezing drizzle':
      return Colors.lightBlue;
    case 'Patchy light rain':
      return Colors.lightBlue;
    case 'Light rain':
      return Colors.lightBlue;
    case 'Moderate rain at times':
      return Colors.lightBlue;
    case 'Moderate rain':
      return Colors.lightBlue;
    case 'Heavy rain at times':
      return Colors.lightBlue;
    case 'Heavy rain':
      return Colors.lightBlue;
    case 'Light freezing rain':
      return Colors.lightBlue;
    case 'Moderate or heavy freezing rain':
      return Colors.lightBlue;
    case 'Light sleet':
      return Colors.lightBlue;
    case 'Moderate or heavy sleet':
      return Colors.lightBlue;
    case 'Patchy light snow':
      return Colors.lightBlue;
    case 'Light snow':
      return Colors.lightBlue;
    case 'Patchy moderate snow':
      return Colors.lightBlue;
    case 'Moderate snow':
      return Colors.lightBlue;
    case 'Patchy heavy snow':
      return Colors.lightBlue;
    case 'Heavy snow':
      return Colors.lightBlue;
    case 'Ice pellets':
      return Colors.lightBlue;
    case 'Light rain shower':
      return Colors.lightBlue;
    case 'Moderate or heavy rain shower':
      return Colors.lightBlue;
    case 'Torrential rain shower':
      return Colors.lightBlue;
    case 'Light sleet showers':
      return Colors.lightBlue;
    case 'Moderate or heavy sleet showers':
      return Colors.lightBlue;
    case 'Light snow showers':
      return Colors.lightBlue;
    case 'Moderate or heavy snow showers':
      return Colors.lightBlue;
    case 'Light showers of ice pellets':
      return Colors.lightBlue;
    case 'Moderate or heavy showers of ice pellets':
      return Colors.lightBlue;
    case 'Patchy light rain with thunder':
      return Colors.deepPurple;
    case 'Moderate or heavy rain with thunder':
      return Colors.deepPurple;
    case 'Patchy light snow with thunder':
      return Colors.deepPurple;
    case 'Moderate or heavy snow with thunder':
      return Colors.deepPurple;
    default:
      return Colors.grey;
  }
}
