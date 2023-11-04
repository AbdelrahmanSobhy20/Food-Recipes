import 'package:flutter/material.dart';
import 'package:foodrecipe/view_models/list_of_food_view_model.dart';
import 'package:provider/provider.dart';

import 'first_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FoodListViewModel>(
      create: (BuildContext context) => FoodListViewModel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FirstPage()),
    );
  }
}