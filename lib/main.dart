import 'package:chateo/screens/screen1.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Chateo());
}

class Chateo extends StatefulWidget {
  const Chateo({super.key});

  @override
  State<Chateo> createState() => _ChateoState();
}

class _ChateoState extends State<Chateo> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark?ThemeData.dark():ThemeData.light(),
      home: Screen1()
    );
  }
}