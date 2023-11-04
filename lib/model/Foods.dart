import 'food.dart';

class Foods{
  late final List<dynamic> foods;
  Foods({ required this.foods});
  factory Foods.fromJson (Map <String , dynamic > jsonData){
    return Foods(foods: jsonData['results']);
  }
}