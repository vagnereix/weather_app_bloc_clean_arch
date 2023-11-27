import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/modules/weather/core/repositories/weather_repository.dart';
import 'package:weather_app/modules/weather/data/datasources/weather_remote_data_source.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource _remoteDataSource;

  WeatherRepositoryImpl({required WeatherRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<Weather> getWeather(Position position) async {
    /**
     * Error treatment should be done here
     */
    return await _remoteDataSource.getWeather(position);
  }

  @override
  Future<Position> getCurrentPosition() async {
    /**
     * Error treatment should be done here
     */
    return await _remoteDataSource.getCurrentPosition();
  }
}
