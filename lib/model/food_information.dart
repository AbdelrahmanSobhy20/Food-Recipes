class FoodInformation{
  late String title;
  late int readyInMinutes;
  late String image;
  late String summary;

  FoodInformation({
    required this.title,
    required this.readyInMinutes,
    required this.image,
    required this.summary
});
  FoodInformation.fromjson(Map<String , dynamic> map){
    title = map['title'];
    readyInMinutes = map['readyInMinutes'];
    image = map['image'];
    summary = map['summary'];
  }

  Map<String , dynamic> tojson(){
    Map <String , dynamic > map = {};
    map['title'] = title;
    map['readyInMinutes'] = readyInMinutes;
    map['image']= image;
    map['summary']= summary;
    return map;
  }

}