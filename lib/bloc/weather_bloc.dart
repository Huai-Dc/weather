/**
 * created by Huai 2019/5/9 0009
 */
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather/bloc/blocs.dart';
import 'package:weather/repositories/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherBloc, WeatherState>{
  final WeatherRepository weatherRepository;

  WeatherBloc({@required this.weatherRepository})
      : assert(weatherRepository != null);

  @override
  WeatherState get initialState => WeatherEmpty();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchWeather) {
      yield WeatherLoading();
      try {
        final Weather weather = await weatherRepository.getWeather(event.city);
        yield WeatherLoaded(weather: weather);
      } catch (_) {
        yield WeatherError();
      }
    }
  }
}
