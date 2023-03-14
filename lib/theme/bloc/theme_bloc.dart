import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ApplicationTheme(
            themeColor: Colors.yellow, themeData: ThemeData.light())) {
    // ignore: void_checks
    on<ChangeTheme>((event, emit) async {
      late ApplicationTheme changetheme;
      switch (event.weatherStatus) {
        case "Rain":
        case "Rainy":
          changetheme = ApplicationTheme(
              themeData: ThemeData(
                primaryColor: Colors.blueGrey,
                appBarTheme:
                    AppBarTheme(backgroundColor: Colors.blueGrey.shade600),
              ),
              themeColor: Colors.blueGrey);
          break;
        case "Clouds":
          changetheme = ApplicationTheme(
            themeColor: Colors.grey,
            themeData: ThemeData(
              primaryColor: Colors.grey,
              appBarTheme: AppBarTheme(backgroundColor: Colors.grey.shade600),
            ),
          );
          break;
        case "Clear":
          changetheme = ApplicationTheme(
            themeColor: Colors.yellow,
            themeData: ThemeData(
              primaryColor: Colors.yellow,
              appBarTheme: AppBarTheme(backgroundColor: Colors.yellow.shade600),
            ),
          );
          break;
        case "Snow":
          changetheme = ApplicationTheme(
            themeColor: Colors.lightBlue,
            themeData: ThemeData(
              primaryColor: Colors.lightBlue.shade300,
              appBarTheme:
                  AppBarTheme(backgroundColor: Colors.lightBlue.shade600),
            ),
          );
          break;
      }
      emit(changetheme);
    });
  }
}
