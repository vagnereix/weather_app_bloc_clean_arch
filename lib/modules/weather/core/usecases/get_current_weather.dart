import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/core/usecases/usecases.dart';
import 'package:weather_app/modules/weather/core/repositories/weather_repository.dart';

class GetWeatherParams extends Equatable {
  final Position position;

  const GetWeatherParams({required this.position});

  @override
  List<Object?> get props => [position];
}

class GetCurrentWeather extends UseCaseWithParams<Weather, GetWeatherParams> {
  final WeatherRepository _weatherRepository;

  GetCurrentWeather({required WeatherRepository weatherRepository})
      : _weatherRepository = weatherRepository;

  @override
  Future<Weather> call(GetWeatherParams params) async {
    return _weatherRepository.getWeather(params.position);
  }
}
