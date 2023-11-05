import 'package:flutter/material.dart';
import 'package:foodrecipe/pages/favorite_screen.dart';
import 'first_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedpage = 0;
  List <Widget> pages = [
    const FirstScreen(),
    const FavoriteScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: const Icon(Icons.view_list_rounded , color:Color(0xFF039278), size: 35,),
        title: const Text("Home" , style: TextStyle(
          color: Color(0xFF039278),
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),),
      ),
      bottomNavigationBar:
      BottomNavigationBar(
        currentIndex: selectedpage,
        iconSize: 40,
        elevation: 50,
        onTap: (index){
          debugPrint('Tapped item $index');
          selectedpage = index;
          setState(() {});
        },
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        selectedIconTheme: const IconThemeData(color:Color(0xFF039278)),
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined) , label: ""),
        BottomNavigationBarItem(label : "", icon: Icon(Icons.favorite_border_outlined)),
      ],
      ),
      body: pages.elementAt(selectedpage),
    );
  }
}
