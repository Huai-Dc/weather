import 'dart:convert';

/**
 * created by Huai 2019/5/10 0010
 */
import 'package:weather/utils/dioUtil.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/data/apis/apis.dart';

class WeatherApiClient {
  Future<Weather> fetchWeather(String cityName) async {
    final weatherUrl = WeatherApis.GET_WEATHER_INFO;
    final weatherResponse = await NetUtils.get(weatherUrl, params: {
      "appkey": WeatherApis.GET_WEATHER_KEY,
      "cityname": cityName,
      "dtype": 'json',
      "format": 1,
    });

    if (weatherResponse.statusCode != 200) {
      throw Exception('error getting weather for location');
    }
    print(weatherResponse);
    return null;
//    final weatherJson = jsonDecode(weatherResponse.body);
//    return Weather.fromJson(weatherJson);
  }
}
