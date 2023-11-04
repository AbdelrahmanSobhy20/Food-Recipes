class SQLModel {
  late int id;
  late String title;
  late String image;

  SQLModel({
    required this.id,
    required this.title,
    required this.image,
  });

  SQLModel.fromAPI(Map<String , dynamic> json){
    id = json['id'];
    title = json['title'];
    image = json['image'];
  }
  
  Map <String , dynamic> toMap(){
    Map <String , dynamic> json = {};
    json['id'] = id;
    json['title'] = title;
    json['image'] = image;
    return json;
  }
}
