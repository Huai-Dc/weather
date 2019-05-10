/**
 * created by Huai 2019/5/8 0008
 */
import "package:flutter/material.dart";
import 'package:weather/widget/Icons/weather_icons.dart';
import 'package:weather/utils/screenUtil.dart';

class WeatherInfo extends StatefulWidget {
  @override
  _WeatherInfoState createState() => _WeatherInfoState();
}

class _WeatherInfoState extends State<WeatherInfo> {
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
          child: ListView(
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
                    Text(
                      "18°",
                      style: TextStyle(
                        fontSize: 80,
                        color: Colors.white,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    Text(
                      "明天白天有雨请注意",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Text(
                      "东北风2级",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
