import 'package:flutter/material.dart';
import 'package:foodrecipe/sql/sql_model.dart';


class Favorite extends StatefulWidget {
  late SQLModel sqlmodel;

  Favorite(this.sqlmodel);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  late String imageurl;
  late String titleofphoto ;
  late int idofphoto;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    idofphoto = widget.sqlmodel.id;
    titleofphoto = widget.sqlmodel.title;
    imageurl= widget.sqlmodel.image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Image.network(
                widget.sqlmodel.image,
                fit: BoxFit.fill,
              ),
              Text(widget.sqlmodel.title),
            ],
          ),
        ),
      ),
    );
  }
}