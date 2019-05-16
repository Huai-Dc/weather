/**
 * created by Huai 2019/5/9 0009
 */
import 'package:flutter/material.dart';
class CommonUI{
  CommonUI._();

  static CommonUI instance = new CommonUI();
  CommonUI(); // 构造


  static const double fs_12 = 16;
  static const double fs_13 = 17;
  static const double fs_14 = 18;
  static const double fs_15 = 19;

  static const double temp_font_size = 80;

  static TextStyle normalTextWhite = TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w100,
  );

  static TextStyle midTextWhite = TextStyle(
    fontSize: 13,
    color: Colors.white,
    fontWeight: FontWeight.w100,
  );

  static TextStyle miniTextWhite = TextStyle(
    fontSize: 10,
    color: Colors.white,
    fontWeight: FontWeight.w100,
  );

  /*
   * Code 对照
   * 00 晴天  01 多云  02 阴天  03 阵雨 04 雷阵雨 05 雷阵雨伴有冰雹  06 雨夹雪 07 小雨  08 中雨 09 大雨 10 暴雨
   * 11 大暴雨 12 特大暴雨  13 阵雪  14 小雪  15 中雪  16 大雪  17  暴雪 18 雾  19 冻雨  20 沙尘暴  21 小雨-中雨
   * 22 中雨-大雨 23 大雨-暴雨 24 暴雨-大暴雨 25 大暴雨-特大暴雨 26 小雪-中雪 27 中雪-大雪 28 大雪-暴雪 29 浮尘
   * 30 扬沙 31 强沙尘暴 53 雾霾
   */
  String getWeatherIconPathByCode(String code, {String time}){
    String basePath = "assets/image/icons/";
    String iconStr;
    switch(code){
      case "00":// 晴天
        iconStr = "sunny@2x.png";
        break;
      case "01": // 多云
        iconStr = "cloudy_sunny@2x.png";
        break;
      case "02": // 阴天
        iconStr = "cloudy@2x.png";
        break;
      case "03": // 阵雨
        iconStr = "shower@2x.png";
        break;
      case "04": // 雷阵雨
        iconStr = "thunder_shower@2x.png";
        break;
      case "05": // 雷阵雨伴有冰雹
        iconStr = "hail@2x.png";
        break;
      case "06": // 雨夹雪
        iconStr = "sleet@2x.png";
        break;
      case "07": // 小雨
        iconStr = "light_rain@2x.png";
        break;
      case "08": // 中雨
        iconStr = "moderate_rain@2x.png";
        break;
      case "09": // 大雨
        iconStr = "heavy_rain@2x.png";
        break;
      case "10": // 暴雨
        iconStr = "heavy_rain@2x.png";
        break;
      case "11": // 大暴雨
        iconStr = "heavy_rain@2x.png";
        break;
      case "12": // 特大暴雨
        iconStr = "heavy_rain@2x.png";
        break;
      case "13": // 阵雪
        iconStr = "light_snow@2x.png";
        break;
      case "14": // 小雪
        iconStr = "light_snow@2x.png";
        break;
      case "15": // 中雪
        iconStr = "moderate_snow@2x.png";
        break;
      case "16": // 大雪
        iconStr = "heavy_snow@2x.png";
        break;
      case "17": // 暴雪
        iconStr = "blizzard@2x.png";
        break;
      case "18": // 雾
        iconStr = "foggy@2x.png";
        break;
      case "19": // 冻雨
        iconStr = "sleet@2x.png";
        break;
      case "20": // 沙尘暴
        iconStr = "sand_storm@2x.png";
        break;
      case "21": // 小雨-中雨
        iconStr = "light_rain@2x.png";
        break;
      case "22": // 中雨-大雨
        iconStr = "moderate_rain@2x.png";
        break;
      case "23": // 大雨-暴雨
        iconStr = "heavy_rain@2x.png";
        break;
      case "24": // 暴雨-大暴雨
        iconStr = "heavy_rain@2x.png";
        break;
      case "25": // 大暴雨-特大暴雨
        iconStr = "heavy_rain@2x.png";
        break;
      case "26": // 小雪-中雪
        iconStr = "light_snow@2x.png";
        break;
      case "27": // 中雪-大雪
        iconStr = "moderate_snow@2x.png";
        break;
      case "28": // 大雪-暴雪
        iconStr = "heavy_snow@2x.png";
        break;
      case "29": // 浮尘
        iconStr = "rais_day@2x.png";
        break;
      case "30": // 扬沙
        iconStr = "sand_storm@2x.png";
        break;
      case "31": // 强沙尘暴
        iconStr = "sand_storm@2x.png";
        break;
      case "53": // 雾霾
        iconStr = "sand_storm@2x.png";
        break;
      default: // 默认为多云
        iconStr = "cloudy_sunny@2x";
    }

    return basePath + iconStr;
  }

}