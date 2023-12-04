import 'package:flutter/material.dart';
import 'package:prayerapp/homePage.dart';
import 'package:prayerapp/widgets/homeNavigation.dart';

void main() {
  fetchData();
  runApp(const homeNavigation());
}


class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: 
      Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 0, 0),
      child: 

       TextFormField(
                      style: const TextStyle(color: Colors.black),

                      decoration: InputDecoration(
                        hintStyle: const TextStyle(
                            color: Colors.black),
                        hintText: "Email Address",
                        labelStyle: const TextStyle(color: Colors.black),
                        labelText: "Email",
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(color: Colors.white, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(color: Colors.white, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(color: Colors.white, width: 1),
                        ),

                        // Add drop shadow
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                  gapPadding: 10.0,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.white),
                  gapPadding: 10.0,
                ),
                      ),
                    ),
      ),
      ),
    );
  }
}