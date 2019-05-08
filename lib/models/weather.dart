/**
 * created by Huai 2019/5/8 0008
 */
class Weather {
  final double temp; // 温度
  final double tempMin; // 最低温
  final double tempMax; // 最高温
  final double pressure; // 气压
  final double humidity; // 湿度
  final String weather; // 天气名称 小雨 ...
  final String week; // 星期
  final String wind_direction; // 风 描述
  final String wind_strength; // 风力等级
  final String date; // 日期
  final String city; // 城市

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
    this.date,
    this.city,
  );

  Weather.fromJson(Map<String, dynamic> json)
      : temp = json["temp"],
        tempMin = json["tempMin"],
        tempMax = json["tempMax"],
        pressure = json["pressure"],
        humidity = json["humidity"],
        weather = json["weather"],
        week = json["week"],
        wind_direction = json["wind_direction"],
        wind_strength = json["wind_strength"],
        date = json["date"],
        city = json["city"];

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
        "city": city,
      };
}
