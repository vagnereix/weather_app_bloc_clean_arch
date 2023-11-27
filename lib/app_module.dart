import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/app_widget.dart';
import 'package:weather_app/modules/weather/core/repositories/weather_repository.dart';
import 'package:weather_app/modules/weather/core/usecases/get_current_position.dart';
import 'package:weather_app/modules/weather/core/usecases/get_current_weather.dart';
import 'package:weather_app/modules/weather/data/datasources/weather_remote_data_source.dart';
import 'package:weather_app/modules/weather/data/repositories/weather_repository_impl.dart';

class AppModule extends StatelessWidget {
  const AppModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<WeatherRemoteDataSource>(
          create: (context) => WeatherRemoteDataSourceImpl(),
        ),
        Provider<WeatherRepository>(
          create: (context) => WeatherRepositoryImpl(
            remoteDataSource: context.read<WeatherRemoteDataSource>(),
          ),
        ),
        Provider<GetCurrentPosition>(
          create: (context) => GetCurrentPosition(
            weatherRepository: context.read<WeatherRepository>(),
          ),
        ),
        Provider<GetCurrentWeather>(
          create: (context) => GetCurrentWeather(
            weatherRepository: context.read<WeatherRepository>(),
          ),
        ),
      ],
      child: const AppWidget(),
    );
  }
}
