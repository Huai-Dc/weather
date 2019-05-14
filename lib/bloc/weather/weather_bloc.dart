/**
 * created by Huai 2019/5/9 0009
 * 业务逻辑层
 */
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather/bloc/weather/weather_state.dart';
import 'package:weather/bloc/weather/weather_event.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/repositories/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState>{
  final WeatherRepository weatherRepository; // 数据存储库

  WeatherBloc({@required this.weatherRepository})
      : assert(weatherRepository != null);

  @override
  WeatherState get initialState => WeatherEmpty();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async*{
    if (event is LoadWeather) {
      yield WeatherLoading(); // 生成器
      try {
        final Weather weather = await weatherRepository.getWeather(event.city);
        print("77777777777777777777777");
        yield WeatherLoaded(weather: weather);
      } catch (error) {
        print("Error：$error");
        yield WeatherError();
      }
    }

    if (event is RefreshWeather) {
      try {
        final Weather weather = await weatherRepository.getWeather(event.city);
        yield WeatherLoaded(weather: weather);
      } catch (_) {
        yield currentState;
      }
    }
  }
}
