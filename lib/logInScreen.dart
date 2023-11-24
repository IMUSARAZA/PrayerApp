import 'package:flutter/material.dart';

void main() {
  runApp(const logInScreen());
}

class logInScreen extends StatefulWidget {
  const logInScreen({super.key});

  @override
  State<logInScreen> createState() => _logInScreenState();
}

class _logInScreenState extends State<logInScreen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                  height: screenHeight / 2 - 100,
                  width: screenWidth / 2,
                ),
              ),
              const Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 10, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                      ),
                      Text(
                        'Log In',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 40,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      Text(
                        "Welcome back, let's get started",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 40, 5),
                child: TextFormField(
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 168, 160, 160),
                    ),
                    hintText: "Enter your email",
                    labelStyle: TextStyle(color: Colors.black),
                    floatingLabelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    labelText: "Email",
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 40, 5),
                child: TextFormField(
                  obscureText: _obscureText,
                  enableSuggestions: false,
                  autocorrect: false,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 168, 160, 160),
                    ),
                    hintText: "Enter your password",
                    labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    floatingLabelStyle: const TextStyle(
                      color: Colors.black,
                    ),
                    labelText: "Password",
                    disabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(_obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
                ),
              ),

            Container(

              margin: const EdgeInsets.fromLTRB(0,5,0,0),

              child: ElevatedButton(
              

                      onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => LoginScreen()),
                          // );
                      },
               
              style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffe1ba2d),
              minimumSize: const Size(400, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), // Set border radius
                ),
                elevation: 5,// Set background color
              ),

                child: const Text(
                  'Log In',
                  style: TextStyle(
                  ),
               ),
               ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5, right: 50),
                  child: TextButton(
                    onPressed: () {
                      // Handle button press
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => LoginScreen()),
                      // );
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.transparent, // Set text color
                    ),
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                      ),
                      ),
                  ),
                ),
              ],
            ),

            ],
          ),
        ),
      ),
    );
  }
}
