import 'package:flutter/material.dart';
import 'package:foodrecipe/api.dart';
import 'model/food.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  API api = API();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Food>?>(
        future: api.fetchFood(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Card(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          GestureDetector(
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
