part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class FetchWeatherStatus extends WeatherEvent {
  final String cityName;
  const FetchWeatherStatus({required this.cityName});

  @override
  List<Object?> get props => [cityName];
}

class RefreshWeatherStatus extends WeatherEvent {
  final String cityName;
  const RefreshWeatherStatus({required this.cityName});

  @override
  List<Object?> get props => [cityName];
}
