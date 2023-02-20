import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:open_weather/const/const.dart';
import 'package:open_weather/models/weather_model.dart';
import 'package:open_weather/resources/weather_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';

class WeatherRepository {
  final _provider = ApiProvider();
  Future<WeatherModel> getCurrentWeather() async {
    bool serviceEnabled;
    LocationPermission permission;
    var locationStatus = await Permission.location.status;

    if (locationStatus.isDenied) {
      Permission.location.request();
    } else {
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
    }
    return _provider.fetchWeather();
  }
}

class NetworkError extends Error{}
