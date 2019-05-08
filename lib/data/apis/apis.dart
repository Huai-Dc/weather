/**
 * created by Huai 2019/5/8 0008
 */
class WeatherApis{
  /* 获取当前城市天气 及未来几天天气
   * cityname String 城市名或城市Id 如 ： "厦门"
   * dtype String 返回数据格式：json或xml,默认json
   * format int 未来7天预报(future)两种返回格式，1或2，默认1
   */
  static const String GET_WEATHER_KEY = "480711127c7790a249d52dbfb94ab545";
  static const String GET_WEATHER_INFO = "http://v.juhe.cn/weather/index";
  /* 获取当前日期黄历信息
   * date String 日期，格式2014-09-09
   */
  static const String GET_ALMANAC_KEY = "1153935acf2af99f56ab3ab30d57a0c3";
  static const String GET_ALMANAC_INFO = "http://v.juhe.cn/laohuangli/d";
}