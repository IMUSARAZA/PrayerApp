import 'package:flutter/material.dart';

void main(){
  runApp(Myapp());
}


class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: 
      Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
      child: 

       TextFormField(
                      style: TextStyle(color: Colors.black),

                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                            color: Colors.black),
                        hintText: "Email Address",
                        labelStyle: TextStyle(color: Colors.black),
                        labelText: "Email",
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: Colors.white, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: Colors.white, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: Colors.white, width: 1),
                        ),

                        // Add drop shadow
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
                  gapPadding: 10.0,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.white),
                  gapPadding: 10.0,
                ),
                      ),
                    ),
      ),
      ),
    );
  }
}