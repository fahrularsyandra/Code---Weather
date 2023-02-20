part of 'cubit/weather_cubit.dart';

@immutable
abstract class WeatherState {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherModel weatherModel;
  const WeatherLoaded(this.weatherModel);
}

class WeatherError extends WeatherState {
  final String? errorMessage;
  const WeatherError(this.errorMessage);
}
