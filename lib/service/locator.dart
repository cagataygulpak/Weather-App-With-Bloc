import 'package:get_it/get_it.dart';
import 'package:weather_app_with_bloc/data/weatherRepository.dart';

import '../data/weather_api_client.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => WeatherRepository());
  locator.registerLazySingleton(() => WeatherApiClient());
}
