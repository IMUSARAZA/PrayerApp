import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const SignUpData());
}

String? dropdownValue;

class SignUpData extends StatefulWidget {
  const SignUpData({Key? key}) : super(key: key);

  @override
  State<SignUpData> createState() => _SignUpDataState();
}

class _SignUpDataState extends State<SignUpData> {

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(150, 50, 0, 0),
                child: Image.asset(
                  "lib/Assets/salat.png",
                  height: screenHeight / 4,
                  width: screenWidth / 4,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 40, 20),
                child: TextFormField(
                  style: GoogleFonts.roboto(color: Colors.black),
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 168, 160, 160),
                    ),
                    hintText: "Enter your Name",
                    labelStyle: TextStyle(color: Colors.black),
                    floatingLabelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    labelText: "Name",
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                          color: Color(0xffe1ba2d), width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                          color: Color(0xffe1ba2d), width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                          color: Color(0xffe1ba2d), width: 1.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 40, 20),
                child: DropdownButtonFormField<String>(
                  icon: const Icon(Icons.male),
                  iconSize: 35,
                  iconEnabledColor: const Color(0xffe1ba2d),
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 168, 160, 160),
                    ),
                    // hintText: "Enter your Gender",
                    labelStyle: TextStyle(color: Colors.black),
                    floatingLabelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    labelText: "Gender",
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                          color: Color(0xffe1ba2d), width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                          color: Color(0xffe1ba2d), width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                          color: Color(0xffe1ba2d), width: 1.0),
                    ),
                  ),
                  value: dropdownValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['Male', 'Female', 'Hanno', 'All of the above']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 40, 20),
                child: DropdownButtonFormField<String>(
                  icon: const Icon(Icons.add_location),
                  iconSize: 35,
                  iconEnabledColor: const Color(0xffe1ba2d),
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 168, 160, 160),
                    ),
                    hintText: "Enter your Location",
                    labelStyle: TextStyle(color: Colors.black),
                    floatingLabelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    labelText: "Location",
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                          color: Color(0xffe1ba2d), width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                          color: Color(0xffe1ba2d), width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                          color: Color(0xffe1ba2d), width: 1.0),
                    ),
                  ),
                  value: dropdownValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['Pakistan', 'Canada', 'United Kingdom']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),

               Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 40, 20),
                child: TextFormField(
                  obscureText: _obscureText,
                  enableSuggestions: false,
                  autocorrect: false,
                  style: GoogleFonts.roboto(color: Colors.black),
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 168, 160, 160),
                    ),
                    hintText: "Enter your password",
                    labelStyle:
                        GoogleFonts.roboto(color: const Color.fromARGB(255, 0, 0, 0)),
                    floatingLabelStyle: const TextStyle(
                      color: Colors.black,
                    ),
                    labelText: "Password",
                    disabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Color(0xffe1ba2d), width: 1.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Color(0xffe1ba2d), width: 1.0),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Color(0xffe1ba2d), width: 1.0),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 13, 0),
                        child: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: const Color(0xffe1ba2d), 
                        size: 30,
                      ),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 40, 20),
                child: TextFormField(
                  obscureText: _obscureText,
                  enableSuggestions: false,
                  autocorrect: false,
                  style: GoogleFonts.roboto(color: Colors.black),
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 168, 160, 160),
                    ),
                    hintText: "Enter your password",
                    labelStyle:
                        GoogleFonts.roboto(color: const Color.fromARGB(255, 0, 0, 0)),
                    floatingLabelStyle: const TextStyle(
                      color: Colors.black,
                    ),
                    labelText: "Confirm Password",
                    disabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Color(0xffe1ba2d), width: 1.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Color(0xffe1ba2d), width: 1.0),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Color(0xffe1ba2d), width: 1.0),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 13, 0),
                        child: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: const Color(0xffe1ba2d), 
                        size: 30,
                      ),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(70, 20, 65, 0),
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
                      borderRadius:
                          BorderRadius.circular(30.0), // Set border radius
                    ),
                    elevation: 5, // Set background color
                  ),
                  child: const Text(
                    'Enter',
                    style: TextStyle(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
