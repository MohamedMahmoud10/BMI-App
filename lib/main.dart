import 'package:bmi/home.dart';
import 'package:flutter/material.dart';

void main ()=>runApp(const HomePage());
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: Colors.black,
        iconTheme:const IconThemeData(color: Colors.white),
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.w900),
          headline2: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),
          bodyText1: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),
        )
      ),

      debugShowCheckedModeBanner: false,
      home:const  MyApp()//Result(result:17, isMale: true, age: 22),
    );
  }
}

