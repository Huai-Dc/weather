import 'dart:async';
import 'dart:convert';

/**
 * created by Huai 2019/5/8 0008
 */
import 'package:meta/meta.dart';
import "package:flutter/material.dart";
import 'package:weather/widget/Icons/weather_icons.dart';
import 'package:weather/utils/screenUtil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/blocs.dart';
import 'package:weather/repositories/repositories.dart';

class Weather extends StatefulWidget {
  final WeatherRepository weatherRepository;

  Weather({
    Key key,
    @required this.weatherRepository,
  })  : assert(weatherRepository != null),
        super(key: key);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  WeatherBloc _weatherBloc;
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    _refreshCompleter = Completer<void>();
    _weatherBloc = WeatherBloc(weatherRepository: widget.weatherRepository);

    _weatherBloc.dispatch(LoadWeather(city: "厦门"));
    super.initState();
  }

  @override
  void dispose() {
    _weatherBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/image/background/night_background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("厦门市"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              icon: Icon(
                WeatherIcon.icon_horn,
                color: Colors.white,
              ),
              onPressed: null),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                WeatherIcon.iosgengduo_o,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Container(
          child: BlocListener(
            bloc: _weatherBloc,
            listener: (BuildContext context, WeatherState state) {
              print(state);
              if (state is WeatherLoaded) {
                print("数据加载成功！");
              }
            },
            child: BlocBuilder(
              bloc: _weatherBloc,
              builder: (_, WeatherState state) {
                if (state is WeatherEmpty) {
                  return Center(child: Text('Please Select a Location'));
                }
                if (state is WeatherLoading) {
                  print("数据加载ing...");
                  return Center(child: Text('loading'));
                }

                if (state is WeatherLoaded) {
                  print("加载成功！");
                  final weather = state.weather;
                  return Container(
                    child: ListView(
                      children: <Widget>[

                      ],
                    ),
                  );
                }

                if (state is WeatherError) {
                  return Text(
                    'Something went wrong!',
                    style: TextStyle(color: Colors.red),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class WeatherInfo extends StatelessWidget {
  final Weather weather;
  final WeatherBloc _weatherBloc;
  WeatherInfo(this.weather, this._weatherBloc);
  @override
  Widget build(BuildContext context){
    return BlocBuilder(
      bloc: _weatherBloc,
      builder: (_, WeatherState){
        return Container(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: ScreenUtil().getWidth(750),
                  height: ScreenUtil().getWidth(450),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            weather.temp + "°",
                            style: TextStyle(
                              fontSize: 80,
                              color: Colors.white,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          Text(
                            weather.weather,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        weather.advice,
                        style: TextStyle(
                            fontSize: 16, color: Colors.white),
                      ),
                      new Row(
                        children: <Widget>[
                          Text(
                            weather.wind_direction +
                                weather.wind_strength,
                            style: TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                          Divider(),
                          Text(
                            "湿度${weather.humidity}",
                            style: TextStyle(
                                fontSize: 16, color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}