part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherStatusLoadingState extends WeatherState {}

class WeatherStatusLoadedState extends WeatherState {
  final WeatherModel weatherModel;
  const WeatherStatusLoadedState({required this.weatherModel})
      : super();
}

class WeatherStatusErrorState extends WeatherState {}
