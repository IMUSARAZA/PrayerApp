import 'package:flutter/material.dart';

void main() {
  runApp(const onBoarding());
}

class onBoarding extends StatefulWidget {
  const onBoarding({super.key});

  @override
  State<onBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Image.asset(
                  "lib/Assets/salat.png",
                  height: screenHeight / 2,
                  width: screenWidth / 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(70, 100, 65, 0),
                child: MaterialButton(
                  onPressed: () {},
                  color: const Color.fromARGB(255, 255, 255, 255),
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255), width: 1),
                  ),
                  textColor: const Color.fromARGB(255, 0, 0, 0),
                  height: 60,
                  child: const Row(
                    children: [
                      SizedBox(width: 20), 
                      Image(
                        image: AssetImage(
                            "lib/assets/google.png"),
                        alignment: Alignment.center,
                        height: 33,
                        width: 32,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 40), 
                      Text(
                        "Sign up with Google",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        ),
                      ), 
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(70, 20, 65, 0),
                child: MaterialButton(
                  onPressed: () {},
                  color: const Color(0xffe1ba2d),
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: const BorderSide(
                        color: Color(0xffe1ba2d), width: 1),
                  ),
                  textColor: const Color.fromARGB(255, 0, 0, 0),
                  height: 60,
                  child: const Row(
                    children: [
                      SizedBox(width: 20), 
                      Image(
                        image: AssetImage(
                            "lib/assets/email.png"),
                        alignment: Alignment.center,
                        height: 33,
                        width: 32,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 40), 
                      Text(
                        "Sign up with Email",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        ),
                      ), 
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(78, 60, 0, 0),
                  child: Row(
                    children: [
                      const Text(
                        "Have an account already?",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      const SizedBox(width: 2),
                      TextButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => LoginScreen()),
                          // );
                        },
                        style: ButtonStyle(
                          side: MaterialStateProperty.all(
                            const BorderSide(color: Colors.transparent),
                          ),
                          minimumSize: MaterialStateProperty.all(const Size(20, 20)),
                        ),
                        child: const Text(
                          "Login Here",
                          style: TextStyle(color: Color(0xffe1ba2d)),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
