import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/view/app_theme.dart';
import 'package:weather_app/core/view/widgets/app_background.dart';
import 'package:weather_app/core/view/widgets/loading_widget.dart';
import 'package:weather_app/modules/weather/core/usecases/get_current_position.dart';
import 'package:weather_app/modules/weather/core/usecases/get_current_weather.dart';
import 'package:weather_app/modules/weather/view/bloc/weather_bloc.dart';
import 'package:weather_app/modules/weather/view/screens/home_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Weather App',
      theme: AppTheme.theme,
      home: FutureBuilder(
        future: context.read<GetCurrentPosition>().call(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return BlocProvider<WeatherBloc>(
              create: (context) => WeatherBloc(
                getCurrentWeather: context.read<GetCurrentWeather>(),
              )..add(FetchWeather(snapshot.data as Position)),
              child: const HomeScreen(),
            );
          } else {
            return const AppBackground(
              child: LoadingWidget(),
            );
          }
        },
      ),
    );
  }
}
