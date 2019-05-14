/**
 * created by Huai 2019/5/10 0010
 */
import 'package:meta/meta.dart';
import 'package:weather/repositories/weatherApiClient.dart';
import 'package:weather/models/weather.dart';

class WeatherRepository{
  final WeatherApiClient weatherApiClient; // DataProvider

  WeatherRepository({@required this.weatherApiClient})
      : assert(weatherApiClient != null);

  Future<Weather> getWeather(String city) async {
    final String locationCity = "厦门";
    return await weatherApiClient.fetchWeather(locationCity);
  }
}