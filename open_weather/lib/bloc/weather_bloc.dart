import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather/bloc/cubit/weather_cubit.dart';
import 'package:open_weather/bloc/weather_event.dart';
import 'package:open_weather/resources/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    final WeatherRepository _wr = WeatherRepository();

    on<GetWeather>((event, emit) async {
      try {
        emit(WeatherLoading());
        final weather = await _wr.getCurrentWeather();
        emit(WeatherLoaded(weather));
        if (weather.error != null) {
          emit(WeatherError(weather.error));
        }
      } on NetworkError {
        emit(const WeatherError("Connection error"));
      }
    });
  }
}
