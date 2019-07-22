import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'layout2.dart';

void main(){
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
  
} 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Layout2(),
    );
  }
}