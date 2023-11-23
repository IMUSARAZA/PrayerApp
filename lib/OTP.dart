import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
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
                  "lib/Assets/salat2.png",
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
                        // textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 48,
                        fontWeight: FontWeight.w900,
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
                      enabledBorderColor: const Color(0xffe1ba2d),
                      focusBorderColor: const Color(0xffe1ba2d),
                      backgroundColor: const Color(0xffffffff),
                      // borderColor: const Color(0xff000000)
                      ),
                  length: 4,
                  width: MediaQuery.of(context).size.width - 50,
                  fieldWidth: 50,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.underline,
                  onCompleted: (pin) {
                    // pinEntered = int.parse(pin);

                    // setState(() {
                    //   isPinEntered = true;
                    // });
                  },
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
                    // foregroundColor: Colors.black,
                    elevation: 0,
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    ),
                  child: const Text(
                    "Resend",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color(0xffe1ba2d),
                    ),
                  ))
            ]),
          ),
            ],
          ),
        ),
      ),
    );
  }
}
