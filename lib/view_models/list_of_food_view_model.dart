import 'package:flutter/cupertino.dart';
import 'package:foodrecipe/api.dart';

import '../model/food.dart';

class FoodListViewModel extends ChangeNotifier{
  List<Food> _foodList = [];

  Future<void> showFood()async{
    _foodList = (await API().fetchFood())!;
    notifyListeners();
  }
  List<Food> get foodList => _foodList;
}