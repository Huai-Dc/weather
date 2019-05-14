import 'dart:convert';

import 'package:meta/meta.dart';
/**
 * created by Huai 2019/5/10 0010
 */
import 'package:weather/utils/dioUtil.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/data/apis/apis.dart';

class WeatherApiClient {

  final NetUtils netUtils;

  WeatherApiClient({@required this.netUtils}) : assert(netUtils != null);

  Future<Weather> fetchWeather(String cityName) async {
    final weatherUrl = WeatherApis.GET_WEATHER_INFO;
    print("请求数据中......");
    final weatherResponse = await NetUtils.get(weatherUrl, params: {
      "key": WeatherApis.GET_WEATHER_KEY,
      "cityname": cityName,
      "dtype": 'json',
      "format": 1,
    });

    if (int.parse(weatherResponse["resultcode"]) != 200) {
      throw Exception('error getting weather for location');
    }

    return Weather.fromJson(weatherResponse["result"]);
  }
}
