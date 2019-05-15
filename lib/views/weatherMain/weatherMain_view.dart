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
import 'package:intl/intl.dart';

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
    DateTime today = DateTime.now();
    DateTime tomorrow = today.add(Duration(days: 1));
    var formatter = new DateFormat("yyyyMMdd");
    var formatter2 = new DateFormat("MM/dd");

    Map today_info = weather.futureWeather["day_${formatter.format(today)}"];
    today_info["date"] = formatter2.format(today);
    today_info["week"] = "今天";
    Map tomorrow_info = weather.futureWeather["day_${formatter.format(tomorrow)}"];
    tomorrow_info["date"] = formatter2.format(tomorrow);

    return BlocBuilder(
      bloc: _weatherBloc,
      builder: (_, WeatherState state) {
        return Container(
          color: Colors.black12,
          child: Row(
            children: <Widget>[
              _buildPanel(today_info),
              _buildPanel(tomorrow_info),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPanel(Map dayWeather) {
    return Container(
      child: Container(
        width: ScreenUtil().getWidth(375),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  dayWeather["week"],
                  style: CommonUI.normalTextWhite,
                ),
                Text(
                  dayWeather["date"],
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
                  dayWeather["weather"],
                  style: CommonUI.normalTextWhite,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  dayWeather["temperature"],
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

// 未来播报
class FutureWeatherBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

