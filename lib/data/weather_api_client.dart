import 'dart:io';

import 'package:dio/dio.dart';
import 'package:weather_app_with_bloc/model/weather_model.dart';

class WeatherApiClient {
  final Dio _dio =
      Dio(BaseOptions(baseUrl: "https://api.collectapi.com/weather"));
  final String _getWeatherEndPoint = "/getWeather";
  Future<WeatherModel> getWeather(String cityName) async {
    var response = await _dio.get(
      _getWeatherEndPoint,
      queryParameters: {"data.lang": "tr", "data.city": cityName},
      options: Options(
        headers: {
          HttpHeaders.authorizationHeader:
              "apikey 6lU1H1T0PUHOhAhlzgXnJ9:0GWkr2AzuA43pgQJqWlILK",
        },
      ),
    );

    if (response.statusCode != 200) {
      throw Exception("No data");
    }

    return WeatherModel.fromJson(response.data);
  }
}
