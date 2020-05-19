import 'package:flutter/material.dart';

class ListItemPage extends StatelessWidget {
  final String id;
  final String name;
  final String image;
  final String description;

  ListItemPage({
    this.id,
    this.description,
    this.image,
    this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Hero(
              tag: '$id',
              child: Container(
                height: 200,
                width: double.infinity,
                child: Image(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              '$name',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text('$description')
          ],
        ),
      ),
    );
  }
}
