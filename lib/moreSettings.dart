import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prayerapp/AdTest.dart';
import 'package:prayerapp/const/customButton.dart';
import 'package:prayerapp/onBoarding.dart';




void main(){
  runApp(moreSettings());
}


class moreSettings extends StatefulWidget {
  const moreSettings({super.key});

  @override
  State<moreSettings> createState() => _moreSettingsState();
}

class _moreSettingsState extends State<moreSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 300, 0, 0),
                    child: Container(
                      height: 50,
                      width: 200,
                      child: customButton(title: "Logout", onPressed: () async{
                         signOut();
                         Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => onBoarding()),
                                    );
                      },),
                    ),
                  ),
          
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Container(
                    height: 50,
                    width: 200,
                    child: customButton(title: "View Add", onPressed: () {
                      // AddClass();
                    },),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    
  }
}


FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> signOut() async {
  await _auth.signOut();
}


// GoogleSignIn _googleSignIn = GoogleSignIn();

// Future<void> signOutGoogle() async {
//   await _googleSignIn.signOut();
//   // You may also need to clear any cached user data or navigate to the login screen.
// }