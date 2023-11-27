import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/usecases/usecases.dart';
import 'package:weather_app/modules/weather/core/repositories/weather_repository.dart';

class GetCurrentPosition extends UseCaseWithoutParams<Position> {
  final WeatherRepository _weatherRepository;

  GetCurrentPosition({required WeatherRepository weatherRepository})
      : _weatherRepository = weatherRepository;

  @override
  Future<Position> call() async {
    return await _weatherRepository.getCurrentPosition();
  }
}
