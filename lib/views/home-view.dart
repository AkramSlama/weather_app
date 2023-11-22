import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get-weather-cubit.dart';
import 'package:weather_app/cubits/get-weather-states.dart';
import 'package:weather_app/views/search-view.dart';
import 'package:weather_app/widgets/no-weather_body.dart';
import 'package:weather_app/widgets/weather-info-body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const SearchView();
                    },
                  ),
                );
              },
              icon: const Icon(Icons.search))
        ],
        title: const Center(
          child: Text('Weather App'),
        ),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherSuccessState) {
            return WeatherInfoBody(
              weather: state.weatherModel,
            );
          } else {
            return const Center(
              child: Text(
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 22,
                ),
                'Oops , There are an error',
              ),
            );
          }
        },
      ),
    );
  }
}
