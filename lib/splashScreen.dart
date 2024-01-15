import 'dart:async';
import 'package:flutter/material.dart';
import 'package:prayerapp/const/appColors.dart';
import 'onBoarding.dart';

void main(){
  runApp(const start());
}

class start extends StatelessWidget {
  const start({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;


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
        MaterialPageRoute(builder: (context) => const fristRun()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Column(
          children: [
              Padding(
              padding: EdgeInsets.fromLTRB(50, 100, 0, 0),
                child: Container(
              
                  height: screenHeight / 2 + 30,
                          width: screenWidth / 2 + 80,
                    child:  Image.asset("lib/Assets/salat.png",height: screenHeight,width: screenWidth,),
                  ),
            ),
            // Padding(
            //   padding: EdgeInsets.fromLTRB(30, 100, 0, 0),
            //   child: Text("Imaan Insight", style: TextStyle(
            //     color: appColors.appBasic,
            //     fontSize: 20,
            //   )),
        
            // ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 150, 0, 0),
              child: Text("Developed By Marhaba Eman & Musa Raza", style: TextStyle(
                color: appColors.appBasic,
                fontSize: 18,
              )),
            ),
          ],
        ),
      );
  }
}