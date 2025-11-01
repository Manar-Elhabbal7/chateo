import 'package:chateo/screens/screen1.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Chateo());
}

class Chateo extends StatelessWidget {
  const Chateo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Screen1()
    );
  }
}