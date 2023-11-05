import 'package:flutter/material.dart';
import 'package:foodrecipe/api/api2.dart';
import 'package:foodrecipe/model/food_information.dart';
import 'package:foodrecipe/sql/sql_model.dart';
import 'package:foodrecipe/sql/sql_provider.dart';

import '../model/food.dart';

class ProductScreen extends StatefulWidget {
  final Food data;

  const ProductScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late FoodInformation response;
  late int id;
  bool favorite = false;
  @override
  void initState() {
    super.initState();
    id = widget.data.id!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xff079681),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: ()
              {
                setState(()
                {
                  FoodProvider.instance.insert(SQLModel(
                        id: id, title: response.title, image: response.image));
                }
                );
              },
              icon: const Icon(Icons.favorite_border_outlined , color: Colors.red,)),
          IconButton(
              onPressed: ()
              {
                setState(()
                {
                  FoodProvider.instance.delete(id);
                   }
                );
              },
              icon: const Icon(Icons.delete , color: Colors.red,)),
          const Icon(Icons.play_circle , color: Colors.black,),
          const Icon(Icons.shopping_cart , color: Colors.grey,),
          const Icon(Icons.share),
        ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<FoodInformation?>(
          future: API2().fetchfoodinfomation(id),
          builder:
              (BuildContext context, AsyncSnapshot<FoodInformation?> snapshot) {
            if (snapshot.hasData) {
              response = snapshot.data!;
              return Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Image.network(
                        response.image,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Text(
                      response.title,
                      style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF039278),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        response.summary,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      "The Time Duration : ${response.readyInMinutes}",
                      style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF039278),
                      ),
                    )
                  ],
                ),
              );
            }
            if (snapshot.hasError) {
              print(snapshot.error.toString());
            }
            return Center(
                child: Container(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(),
            ));
          },
        ),
      ),
    );
  }
}
