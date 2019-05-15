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
import 'package:weather/models/weather.dart';
import 'package:weather/utils/commonUIUtil.dart';

class WeatherView extends StatefulWidget {
  final WeatherRepository weatherRepository;

  WeatherView({
    Key key,
    @required this.weatherRepository,
  })  : assert(weatherRepository != null),
        super(key: key);

  @override
  _WeatherViewState createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
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
                        WeatherInfo(weather, _weatherBloc),
                        SizedBox(
                          height: 20,
                        ),
                        RecentWeatherBar(weather, _weatherBloc),
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

// 天气模块
class WeatherInfo extends StatelessWidget {
  final Weather weather;
  final WeatherBloc _weatherBloc;

  WeatherInfo(this.weather, this._weatherBloc);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _weatherBloc,
      builder: (_, WeatherState state) {
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
                            style: CommonUI.normalTextWhite,
                          ),
                        ],
                      ),
                      Text(
                        weather.advice,
                        style: CommonUI.normalTextWhite,
                      ),
                      new Row(
                        children: <Widget>[
                          Text(
                            weather.wind_direction + weather.wind_strength,
                            style: CommonUI.normalTextWhite,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "湿度${weather.humidity}",
                            style: CommonUI.normalTextWhite,
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

// 今天及明天
class RecentWeatherBar extends StatelessWidget {
  final Weather weather;
  final WeatherBloc _weatherBloc;

  RecentWeatherBar(this.weather, this._weatherBloc);

  @override
  Widget build(BuildContext context) {
    List future = [];
    print("----------------------------");
    // Map future = weather.futureWeather;
    print(weather.futureWeather);
    weather.futureWeather.forEach((key, value)=>{
      // if(future.length == 2) break;
      future.add(value)
    });

    print(future.toString());
    
    return BlocBuilder(
      bloc: _weatherBloc,
      builder: (_, WeatherState state) {
        return Container(
          color: Colors.black12,
          child: Row(
            children: <Widget>[
              _buildPanel(),
              _buildPanel(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPanel() {
    return Container(
      child: Container(
        width: ScreenUtil().getWidth(375),
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '今天',
                  style: CommonUI.normalTextWhite,
                ),
                Text(
                  "05/15",
                  style: CommonUI.midTextWhite,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(
                  "assets/image/icons/light_rain@2x.png",
                  width: ScreenUtil().getWidth(50),
                ),
                Text(
                  "小雨转阴",
                  style: CommonUI.normalTextWhite,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "26°/23°",
                  style: CommonUI.normalTextWhite,
                ),
                Text(
                  "优",
                  style: CommonUI.normalTextWhite,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
