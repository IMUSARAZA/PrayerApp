import 'package:flutter/material.dart';
import 'package:prayerapp/PrayerTimeCalculation.dart';
import 'package:prayerapp/homePage.dart';
import 'package:prayerapp/widgets/homeNavigation.dart';

late final Map<String, dynamic>? prayerTimesFirst;

void main() async {
  prayerTimesFirst = await PrayerTimeCalculation.calculatePrayerTimes();

  runApp(homeNavigation()); 
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