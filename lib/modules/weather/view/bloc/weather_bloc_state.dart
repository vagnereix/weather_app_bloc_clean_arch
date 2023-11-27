part of 'weather_bloc.dart';

@immutable
sealed class WeatherBlocState {}

final class WeatherBlocInitial extends WeatherBlocState {}

final class WeatherBlocLoading extends WeatherBlocState {}

final class WeatherBlocFailure extends WeatherBlocState {}

final class WeatherBlocSuccess extends WeatherBlocState {
  final Weather weather;

  WeatherBlocSuccess({required this.weather});
}
