import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get-weather-cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search City',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              var getWeatherCubit = BlocProvider.of<WeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value); // Trigger Cubit
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              labelText: 'Search',
              hintText: 'Enter City Name',
              hintStyle: const TextStyle(fontFamily: 'Ubuntu'),
              suffixIcon: const Icon(Icons.search),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.black)),
            ),
          ),
        ),
      ),
    );
  }
}
