import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:open_weather/models/weather_model.dart';

import '../const/const.dart';

class ApiProvider {
  final Dio _dio = Dio();

  Future<WeatherModel> fetchWeather() async {
    try {
      var position = await Geolocator.getCurrentPosition();
      var response = await _dio.get(DOMAIN, queryParameters: <String, dynamic>{
        'lat': position.latitude,
        'lon': position.longitude,
        'appid': APPID
      });
      if (response.statusCode == 200) {
        print("response: ${response.data}");
        return WeatherModel.fromJson(response.data);
      }
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occured: $error stacktrace: $stacktrace");
      }
      return WeatherModel.withError('Data not found');
    }

    return WeatherModel.withError('Data not found');
  }
}
