import 'package:flutter/material.dart';
import 'package:flutter_app/setup/signin.dart';


void main() => runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sign In',
      theme:  ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: LoginPage(),
    );
  }
}


