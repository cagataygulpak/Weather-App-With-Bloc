// ignore_for_file: file_names

import 'package:weather_app_with_bloc/data/weather_api_client.dart';
import 'package:weather_app_with_bloc/model/weather_model.dart';
import 'package:weather_app_with_bloc/service/locator.dart';

class WeatherRepository {
  WeatherApiClient weatherApiClient = locator<WeatherApiClient>();
  Future<WeatherModel> getWeather(String city) async {
    final WeatherModel weather = await weatherApiClient.getWeather(city);
    return weather;
  }
}
