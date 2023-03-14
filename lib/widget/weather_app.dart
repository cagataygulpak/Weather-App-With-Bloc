// ignore_for_file: must_be_immutable, no_leading_underscores_for_local_identifiers, unnecessary_null_comparison
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_with_bloc/bloc/weather_bloc.dart';
import 'package:weather_app_with_bloc/theme/bloc/theme_bloc.dart';
import 'package:weather_app_with_bloc/widget/change_background_color.dart';
import 'package:weather_app_with_bloc/widget/search_location.dart';
import '../constant/constant.dart';
import 'last_update.dart';
import 'location.dart';
import 'max_min_temperature.dart';
import 'status_weather.dart';

class WeatherApp extends StatelessWidget {
  WeatherApp({super.key});
  String chosenCity = "Bursa";

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    Completer<void> _refreshCompleter = Completer<void>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Application"),
        actions: [
          IconButton(
            onPressed: () async {
              chosenCity = await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SearchLocation(),
                    ),
                  ) ??
                  "";

              if (chosenCity != null) {
                _weatherBloc.add(FetchWeatherStatus(cityName: chosenCity));
              }
            },
            icon: const Icon(Icons.search_outlined),
          ),
        ],
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        bloc: _weatherBloc,
        builder: (context, state) {
          if (state is WeatherStatusLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherStatusLoadedState) {
            final weatherCame = state.weatherModel;
            chosenCity = weatherCame.city!;
            BlocProvider.of<ThemeBloc>(context).add(
                ChangeTheme(weatherStatus: weatherCame.result![0].status ?? "Ankara"));
            _refreshCompleter.complete();
            _refreshCompleter = Completer<void>();
            return BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return ChangeBackgroundColor(
                  color: (state as ApplicationTheme).themeColor,
                  child: RefreshIndicator(
                    onRefresh: () {
                      _weatherBloc
                          .add(RefreshWeatherStatus(cityName: chosenCity));
                      return _refreshCompleter.future;
                    },
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 10),
                      children: [
                        LocationWidget(city: chosenCity),
                        10.0.sizedBoxHeightValue(),
                        const LastUpdate(),
                        const StatusWeather(),
                        const MaxandMinTemperature(),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is WeatherStatusErrorState) {
            return const Center(child: Text("No Data"));
          } else {
            return const Center(child: Text("Initializing"));
          }
        },
      ),
    );
  }
}
