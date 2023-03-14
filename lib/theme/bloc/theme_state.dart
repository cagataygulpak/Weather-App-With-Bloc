part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class ThemeInitial extends ThemeState {}

class ApplicationTheme extends ThemeState {
  final ThemeData themeData;
  final MaterialColor themeColor;
  const ApplicationTheme({required this.themeColor, required this.themeData})
      : super();
}
