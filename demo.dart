import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Text("Comrade's Club"),
      centerTitle: true,
      backgroundColor: Colors.lightBlueAccent[200],
    ),
    body: Center(
      child: Text(
        "Hello Rowdy..",
        style: TextStyle(
          fontSize: 40.0,
          letterSpacing: 3.0,
          color: Colors.black,
          fontFamily: 'Shadows',
        ),
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      child: Text("Press"),
      backgroundColor: Colors.black,
    ),
  ),
));
