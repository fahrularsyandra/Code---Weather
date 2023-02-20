import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable{
  const WeatherEvent();

  List<Object> get props => [];
}

class GetWeather extends WeatherEvent{}