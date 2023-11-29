import 'package:flutter/material.dart';

void main() {
  runApp(const homePage());
}

class homePage extends StatefulWidget {
  const homePage({super.key});
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SizedBox(
          child: Column(children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 50, 0, 20),
              height: 0.5, // Set the height of the line
              color: Color(0xffe1ba2d), // Set the color of the line
            ),
            Stack(
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 45, 38, 38),
                      borderRadius: BorderRadius.circular(
                          10.0), // Adjust the radius as needed
                    ),
                    width: 350.0,
                    height: 150.0,
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 7, 0, 0),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          color: Color(0xffe1ba2d),
                          fontSize: 20,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    )),
                Positioned(
                  top: 30.0,
                  left: 50.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: const Text(
                          'Fajr',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                        child: const Text(
                          '5:08 a.m.',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                        child: Image.asset(
                          "lib/Assets/checkBoxIcon.png",
                          height: 25,
                          width: 25,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 50.0,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                    decoration: BoxDecoration(
                      color: Color(0xffe1ba2d),
                      borderRadius: BorderRadius.circular(50.0),
                      // Adjust the radius as needed
                    ),
                    width: 65.0,
                    height: 65.0,
                  ),
                ),
                Positioned(
                  right: 50.0,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 42.5, 2.6, 0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 45, 38, 38),
                      borderRadius: BorderRadius.circular(50.0),
                      // Adjust the radius as needed
                    ),
                    width: 60.0,
                    height: 60.0,
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        '00:45:31',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 10,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 45, 38, 38),
                borderRadius:
                    BorderRadius.circular(10.0), // Adjust the radius as needed
              ),
              width: 350.0,
              height: 230.0,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 7, 0, 0),
                    child: const Text(
                      'Dua of the day',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                    alignment: Alignment.center,
                    child: const Text(
                      'رَبَّنَا تَقَبَّلۡ مِنَّآۖ إِنَّكَ أَنتَ ٱلسَّمِيعُ ٱلۡعَلِيمُ' + '\n'+ '"Our Lord, accept [this] from us. Indeed You are the Hearing, the Knowing"' + '\n' + '– 2:127 –',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
