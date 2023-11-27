import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/core/utils/constants.dart';
import 'package:weather_app/modules/weather/core/repositories/weather_repository.dart';

abstract class WeatherRemoteDataSource extends WeatherRepository {}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  @override
  Future<Position> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Future<Weather> getWeather(Position position) async {
    WeatherFactory wf = WeatherFactory(
      kApiKey,
      language: Language.ENGLISH,
    );

    return await wf.currentWeatherByLocation(
      position.latitude,
      position.longitude,
    );
  }
}
