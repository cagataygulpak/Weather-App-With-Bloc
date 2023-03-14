// ignore_for_file: unnecessary_cast, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_with_bloc/constant/constant.dart';
import '../bloc/weather_bloc.dart';

class MaxandMinTemperature extends StatelessWidget {
  const MaxandMinTemperature({super.key});

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder<WeatherBloc, WeatherState>(
      bloc: _weatherBloc,
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            10.0.sizedBoxHeightValue(),
            Text(
              "Maksimum Temperature: ${(state as WeatherStatusLoadedState).weatherModel.result![0].max!}°C",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            10.0.sizedBoxHeightValue(),
            Text(
              "Minimum Temperature: ${(state as WeatherStatusLoadedState).weatherModel.result![0].min!}°C",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            )
          ],
        );
      },
    );
  }
}
