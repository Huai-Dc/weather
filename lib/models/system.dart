/**
 * created by Huai 2019/5/8 0008
 */
class System{
  final String country;
  final int sunrise;
  final int sunset;

  System(this.country, this.sunrise, this.sunset);

  System.fromJson(Map<String,dynamic> json): country = json["country"], sunrise = json["sunrise"], sunset = json["sunset"];

  Map<String,dynamic> toJson() =>{
    "country": country,
    "sunrise": sunrise,
    "sunset": sunset
  };
}