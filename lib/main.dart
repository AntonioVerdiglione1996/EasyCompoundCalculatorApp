import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
<<<<<<< HEAD

=======
>>>>>>> 06bab17d556decb4def542286af8acfec28bd82c
import 'newTestLayout.dart';

void main(){
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
  
} 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TestLayout(),
    );
  }
}