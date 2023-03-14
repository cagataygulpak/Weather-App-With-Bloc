// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/weather_bloc.dart';

class StatusWeather extends StatelessWidget {
  const StatusWeather({super.key});

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder<WeatherBloc, WeatherState>(
      bloc: _weatherBloc,
      builder: (context, state) {
        return Image.network(
          (state as WeatherStatusLoadedState).weatherModel.result![0].icon!,
          height: 200,
          width: 200,
        );
      },
    );
  }
}
