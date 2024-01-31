import 'dart:convert';

import '../model/food_information.dart';
import 'package:http/http.dart' as http;


class API2{
  Future<FoodInformation?> fetchfoodinfomation(int id) async{
    http.Response response = await http.get(Uri.parse(
    "https://api.spoonacular.com/recipes/$id/information?includeNutrition=false&apiKey=1a01d256345648ebad7694423005c1bb&cuisine=egyptian"));
    if (response.statusCode >= 200 && response.statusCode <= 299){
      final Map<String , dynamic> jsonbody = jsonDecode(response.body);
      FoodInformation informationlist=FoodInformation.fromjson(jsonbody);
      return informationlist;
    }else{
      print('statusCode = ${response.statusCode}');
    }
  }
}