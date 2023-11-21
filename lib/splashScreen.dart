import 'dart:async';
import 'package:flutter/material.dart';
import 'onBoarding.dart';

void main(){
  runApp(const start());
}

class start extends StatelessWidget {
  const start({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splashScreen(),
    );
  }
}


class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
  
}

class _splashScreenState extends State<splashScreen> {

   @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => onBoarding()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return  Scaffold(
        body: Container(
            child:  Center(
            child: Image.asset("lib/Assets/splashScreen.jpg",height: screenHeight,width: screenWidth,),
            ),
          ),
      );
  }
}