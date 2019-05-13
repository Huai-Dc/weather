/**
 * created by Huai 2019/5/13 0013
 */
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weather/models/weather.dart';

abstract class WeatherEvent extends Equatable {
  WeatherEvent([List props = const []]) : super(props);
}

// 加载天气数据
class LoadWeather extends WeatherEvent {
  final String city;

  LoadWeather({@required this.city})
      : assert(city != null),
        super([city]);

  @override
  String toString() => 'LoadWeather';
}
// 刷新天气数据
class RefreshWeather extends WeatherEvent {
  final String city;

  RefreshWeather({@required this.city})
      : assert(city != null),
        super([city]);

  @override
  String toString() => 'RefreshWeather';
}
