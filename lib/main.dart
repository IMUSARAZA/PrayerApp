import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prayerapp/PrayerTimeCalculation.dart';
import 'package:prayerapp/firebase_options.dart';
import 'package:prayerapp/homePage.dart';
import 'package:prayerapp/onBoarding.dart';
import 'package:prayerapp/widgets/homeNavigation.dart';

late Map<String, dynamic> ?prayerTimesFirst;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  prayerTimesFirst = await PrayerTimeCalculation.calculatePrayerTimes();

  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );

  print(prayerTimesFirst);
  
  runApp(const fristRun());   // ONBOARDING
}


class Myapp extends StatefulWidget {

  const Myapp({Key? key,}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}