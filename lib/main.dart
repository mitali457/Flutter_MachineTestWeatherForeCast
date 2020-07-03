import 'package:flutter/material.dart';
import 'package:machinetest/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
          primaryColor: Colors.white,
          inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.purpleAccent),
            hintStyle: TextStyle(color: Colors.purple),
          )),
      
      home: Homescreen(),
    );
  }
}

