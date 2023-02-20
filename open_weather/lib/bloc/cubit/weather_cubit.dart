import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:open_weather/models/weather_model.dart';

part '../weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
}
