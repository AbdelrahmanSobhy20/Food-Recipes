import 'package:flutter/material.dart';
import 'package:foodrecipe/pages/product_screen.dart';

import '../api/api.dart';
import '../model/food.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List sqlList = [];
  API api = API();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Food>?>(
        future: api.fetchFood(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            sqlList = snapshot.data;
            return Card(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 6,
                      crossAxisSpacing: 25),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductScreen(
                                      data: sqlList.elementAt(i),
                                    ),
                                  ),
                                );
                                //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SecondPage(sqlmodel)));
                              });
                            },
                              child: Image.network(snapshot.data[i].image)),
                          Text(snapshot.data[i].title , style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),),
                        ],
                      ),
                    );
                  }),
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text("Error"));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
