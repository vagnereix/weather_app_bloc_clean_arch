import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/modules/weather/core/usecases/get_current_weather.dart';

part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class WeatherBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  final GetCurrentWeather _getCurrentWeather;

  WeatherBloc({required GetCurrentWeather getCurrentWeather})
      : _getCurrentWeather = getCurrentWeather,
        super(WeatherBlocLoading()) {
    on<FetchWeather>(_getCurrentWeatherByPosition);
  }

  Future<void> _getCurrentWeatherByPosition(
    FetchWeather event,
    Emitter<WeatherBlocState> emit,
  ) async {
    emit(WeatherBlocLoading());

    try {
      final Weather weather = await _getCurrentWeather.call(
        GetWeatherParams(position: event.position),
      );

      emit(WeatherBlocSuccess(weather: weather));
    } catch (e) {
      emit(WeatherBlocFailure());
    }
  }
}
