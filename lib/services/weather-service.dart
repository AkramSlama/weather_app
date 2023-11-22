import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model/weather_model.dart';


class WeatherService {
  final Dio dio;
  WeatherService(this.dio);
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = 'key=4a0732a2b2814b0b81b191710230711';
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get('http://api.weatherapi.com/v1/forecast.json?key=4a0732a2b2814b0b81b191710230711&q=$cityName');
      print(response.data);
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ??
          'oops there was an error, please try again later';
      throw Exception(errMessage);
    } catch (e) {
      print(e);
      throw Exception('oops there was an error, please try again later');
    }
  }
}
