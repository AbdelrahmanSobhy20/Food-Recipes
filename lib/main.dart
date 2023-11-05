import 'package:flutter/material.dart';
import 'package:foodrecipe/sql/sql_provider.dart';
import 'pages/home_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await FoodProvider.instance.open();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage());
  }
}