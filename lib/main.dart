import 'package:flutter/material.dart';
import 'package:ch8_navigator/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

//The main class of the App
class MyApp extends StatelessWidget {

  //constructeur de l'application
  const MyApp({super.key});

  //The build method, which define the UI structure
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Application title
      title: 'Flutter Demo',
      //the main ThemeData of the App
      theme: ThemeData(
        primarySwatch: Colors.deepPurple, //UI main color
        useMaterial3: true, //using Material Design 3
      ),
      //Home page of the APP
      home: const HomePage(),
    );
  }
}

