/**
 * created by Huai 2019/5/8 0008
 */
class City{
  final int id;
  final String name;

  City(this.id, this.name);

  City.fromJson(Map<String,dynamic> json): id = json["id"], name = json["name"];

  Map<String,dynamic> toJson() =>{
    "id":id,
    "name":name
  };
}