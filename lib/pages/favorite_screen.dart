import 'package:flutter/material.dart';
import 'package:foodrecipe/sql/sql_provider.dart';
import '../sql/sql_model.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List <SQLModel> recipes = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<SQLModel>>(
        future: FoodProvider.instance.getAllRecepies(),
        builder: (BuildContext context, snapshot) {
          if(snapshot.hasData) {
            recipes = snapshot.data!;
            return Card(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 6,
                      crossAxisSpacing: 25),
                  itemCount: recipes.length,
                  itemBuilder: (context, i) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                         Image.network(recipes.elementAt(i).image),
                          Text(recipes.elementAt(i).title , style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                          ),),
                        ],
                      ),
                    );
                  }),
            );
          }
          if (snapshot.hasError) {
            print(snapshot.error.toString());
          }
          return const Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(),
            ),
          );
        },
      )
    );
  }
}
