import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_with_bloc/data/weatherRepository.dart';
import 'package:weather_app_with_bloc/service/locator.dart';
import '../model/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository = locator<WeatherRepository>();
  WeatherBloc() : super(WeatherInitial()) {
   
    on<FetchWeatherStatus>((event, emit) async {
      emit(WeatherStatusLoadingState());
      try {
        final WeatherModel weatherCame =
            await _weatherRepository.getWeather(event.cityName);
        emit(WeatherStatusLoadedState(weatherModel: weatherCame));
      } catch (_) {
        emit(WeatherStatusErrorState());
      }
    });
    
    on<RefreshWeatherStatus>((event, emit) async {
      try {
        final WeatherModel weatherCame =
            await _weatherRepository.getWeather(event.cityName);
        emit(WeatherStatusLoadedState(weatherModel: weatherCame));
      } catch (_) {
        emit(state);
      }
    });
  }
}
