import 'dart:convert';
import 'package:foodrecipe/model/Foods.dart';
import '../model/food.dart';
import 'package:http/http.dart' as http;

var url = Uri.parse("https://api.spoonacular.com/recipes/complexSearch?query=pasta&number=15&apiKey=1a01d256345648ebad7694423005c1bb&cuisine=egyptian");

class API{

   Future <List<Food>?> fetchFood() async{
    try {
    final http.Response response =await http.get(url);
    if (response.statusCode >= 200 && response.statusCode <= 299){
      String data = response.body;
      var jsonData = jsonDecode(data);
      Foods foods = Foods.fromJson(jsonData);
      List<Food> foodlist = foods.foods.map((e) => Food.fromJson(e)).toList();
      return foodlist;
    }else{
      print('statusCode = ${response.statusCode}');
    }
  }catch (ex){
      print(ex);
    }
  }
}