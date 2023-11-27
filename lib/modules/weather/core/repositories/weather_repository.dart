import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

abstract class WeatherRepository {
  Future<Position> getCurrentPosition();
  Future<Weather> getWeather(Position position);
}
