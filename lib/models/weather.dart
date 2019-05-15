/**
 * created by Huai 2019/5/8 0008
 */
class Weather {
  final String temp; // 温度
  final String tempMin; // 最低温
  final String tempMax; // 最高温
  final String pressure; // 气压
  final String humidity; // 湿度
  final String weather; // 天气名称 小雨 ...
  final String week; // 星期
  final String wind_direction; // 风 描述
  final String wind_strength; // 风力等级
  final String date; // 日期
  final String city; // 城市
  final String time; // 更新时间
  final String advice; // 建议
  final String dressing_index; // 穿衣指数（冷、 热...）
  final String uv_index; // 紫外线指数
  final Map<String, dynamic> futureWeather; // 未来天气

  Weather(
    this.temp,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.weather,
    this.week,
    this.wind_direction,
    this.wind_strength,
    this.time,
    this.date,
    this.city,
    this.advice,
    this.dressing_index,
    this.uv_index,
    this.futureWeather,
  );

  Weather.fromJson(Map<String, dynamic> json)
      : temp = json["sk"]["temp"],
        time = json["sk"]["time"],
        wind_direction = json["sk"]["wind_direction"],
        wind_strength = json["sk"]["wind_strength"],
        tempMin = json["today"]["temperature"],
        tempMax = json["today"]["temperature"],
        pressure = json["today"]["pressure"],
        humidity = json["sk"]["humidity"],
        weather = json["today"]["weather"],
        week = json["today"]["week"],
        date = json["today"]["date_y"],
        advice = json["today"]["dressing_advice"],
        dressing_index = json["today"]["dressing_index"],
        uv_index = json["today"]["uv_index"],
        futureWeather = json["future"],
        city = json["today"]["city"];

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "tempMin": tempMin,
        "tempMax": tempMax,
        "pressure": pressure,
        "humidity": humidity,
        "weather": weather,
        "week": week,
        "wind_direction": wind_direction,
        "wind_strength": wind_strength,
        "date": date,
        "time": time,
        "city": city,
        "uv_index": uv_index,
        "futureWeather": futureWeather,
      };

//  void get
}
