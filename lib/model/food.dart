class Food {
  int? id;
  String? title;
  String? image;
  String? imageType;

  Food({this.id, this.title, this.image, this.imageType});

  factory Food.fromJson(Map<String, dynamic> jsonData) {
    return Food(
        id: jsonData["id"],
        title: jsonData["title"],
        image: jsonData["image"],
        imageType: jsonData["imageType"]);
  }
}
