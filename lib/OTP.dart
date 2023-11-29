import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prayerapp/const/customButton.dart';
import 'const/appColors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const OTP());
}

class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    print(screenHeight);
    print(screenWidth);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SizedBox(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,

            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 0, 0, 0),
                child: Image.asset(
                  "lib/Assets/salat.png",
                  height: screenHeight / 2,
                  width: screenWidth / 2,
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: Text("OTP Code",
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.clip,
                    style: GoogleFonts.roboto(
                        fontSize: 48,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        color: const Color(0xff000000))),
              ),

              const Padding(
                padding: EdgeInsets.fromLTRB(40, 10, 0, 40),
                child: Text(
                  "We have sent the OTP Code on to your given Email address",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    color: Color(0xff000000),
                  ),
                ),
              ),

              Center(
                child: OTPTextField(
                  outlineBorderRadius: 5,
                  keyboardType: TextInputType.number,
                  otpFieldStyle: OtpFieldStyle(
                      enabledBorderColor: appColors.appBasic,
                      focusBorderColor: appColors.appBasic,
                      backgroundColor: const Color(0xffffffff),
                      ),
                  length: 4,
                  width: MediaQuery.of(context).size.width - 50,
                  fieldWidth: 50,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.underline,
                ),
              ),

               Padding(
            padding: const EdgeInsets.only(top: 40, left: 40),
            child: Row(
              children: [
              const Text(
                "Didn't receive the code yet? ",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Color(0xff000000),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    // sendOTP();
                  },
                  style: ElevatedButton.styleFrom(

                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    ),
                  child: const Text(
                    "Resend",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: appColors.appBasic,
                    ),
                  ),
                  ),
            ],
            ),
          ),
           Padding(
                padding: const EdgeInsets.fromLTRB(70, 20, 65, 0),
                child: Material(
                  child: InkWell(
                child: customButton(title: 'Enter', onPressed: () {},),
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
