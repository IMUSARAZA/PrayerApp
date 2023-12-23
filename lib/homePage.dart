import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:prayerapp/Hadith.dart';
import 'package:prayerapp/compass/loading_indicator.dart';
import 'package:prayerapp/const/appColors.dart';
import 'package:prayerapp/main.dart';
import 'package:prayerapp/widgets/homeNavigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:http/http.dart' as http;
import 'package:jhijri/jHijri.dart';


class homePage extends StatefulWidget {
  final String? userLocation;
  const homePage({this.userLocation, Key? key}) : super(key: key);
  @override
  State<homePage> createState() => _homePageState();
}

var bookslug = 'sahih-bukhari';
var number = 5;
String? nextPrayerName, nextPrayerTime, islamicDate;
Timer? timer;
DateTime? nextRemainingTime;
Duration remainingTime = Duration.zero;
List<Hadith> hadithList = [];

class _homePageState extends State<homePage> {
  final centerTextStyle = const TextStyle(
    fontSize: 14,
    color: appColors.appBasic,
    fontWeight: FontWeight.bold,
  );

  ValueNotifier<double>? valueNotifier;
  bool? isCheckedbox = false;
  Color? checkColor = const Color(0xFF2E2E2E);

  @override
  void initState() {
    if (prayerTimesFirst == null) {
      print('Program war gya');
      return;
    }
    calculate();
    nextCalculate();
    startTimer();
    remainingTime = nextRemainingTime!.difference(DateTime.now());
    // Set the ValueNotifier to the maximum value initially
    valueNotifier = ValueNotifier<double>(remainingTime.inSeconds.toDouble());
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    valueNotifier!.dispose();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      updateRemainingTime();
    });
  }

  void updateRemainingTime() {
  DateTime now = DateTime.now();
  if (nextRemainingTime == null) {
    return;
  }
  remainingTime = nextRemainingTime!.difference(now);
}


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF2E2E2E),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      width: 350.0,
                      height: 200.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: Text(
                                  '$islamicDate',
                                  style: const TextStyle(
                                    color: Color(0xffe1ba2d),
                                    fontSize: 15,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                child: Container(
                                  width: 100,
                                  // height: 200,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            
                                        children: [
                                          IconButton(
                                            icon:
                                                const Icon(Icons.location_pin),
                                            color: appColors.appBasic,
                                            iconSize: 25,
                                            onPressed: () {},
                                          ),
                                          Text(
                                            '${widget.userLocation}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                5, 0, 0, 0),
                                            child: Text(
                                              nextPrayerName!,
                                              style: const TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 0, 0, 0),
                                        child: Text(
                                          nextPrayerTime!,
                                          style: const TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 0),
                                        child: Checkbox(
                                          value: isCheckedbox,
                                          activeColor: checkColor,
                                          side: const BorderSide(
                                              color: Colors.white),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          onChanged: (value) {
                                            if (isCheckedbox == true) {
                                              setState(() {
                                                isCheckedbox = false;
                                                checkColor =
                                                    const Color.fromARGB(
                                                        255, 45, 38, 38);
                                              });
                                            } else {
                                              setState(() {
                                                isCheckedbox = true;
                                                checkColor = appColors.appBasic;
                                              });
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: SimpleCircularProgressBar(
                                      size: 150,
                                      // maxValue: remainingTime.inSeconds.toDouble(),
                                      startAngle: 0,
                                      progressStrokeWidth: 3,
                                      progressColors: const [
                                        appColors.appBasic,
                                      ],
                                      animationDuration: 10000,
                                      backStrokeWidth: 1,
                                      backColor: Colors.transparent,
                                      mergeMode: true,
                                      valueNotifier: valueNotifier,
                                      onGetText: (value) {
                                        int totalHours = remainingTime.inHours;
                                        int totalMinutes =
                                            remainingTime.inMinutes % 60;
                                        int totalSeconds =
                                            remainingTime.inSeconds % 60;

                                        int remainingHours =
                                            totalHours - (value / 3600).floor();
                                        int remainingMinutes = totalMinutes -
                                            ((value % 3600) / 60).floor();
                                        int remainingSeconds =
                                            totalSeconds - (value % 60).floor();

                                        if (remainingSeconds < 0) {
                                          remainingSeconds += 60;
                                          remainingMinutes--;
                                        }

                                        if (remainingMinutes < 0) {
                                          remainingMinutes += 60;
                                          remainingHours--;
                                        }

                                        return Text(
                                          '$remainingHours:${remainingMinutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}',
                                          style: centerTextStyle,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors
                              .white, 
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        width: 350.0,
                        height: screenHeight / 2 - 100,
                        child: FutureBuilder<List<Hadith>>(
                          future: fetchData(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return LoadingIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else if (!snapshot.hasData ||
                                snapshot.data!.isEmpty) {
                              return const Text('No data available.');
                            } else {
                              List<Hadith> hadithList = snapshot.data!;

                              return ListView.builder(
                                itemCount: hadithList.length,
                                itemBuilder: (context, index) {
                                  Hadith hadith = hadithList[index];
                                  return Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 15, 10, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Center(
                                          child: Text('Hadith of the day \n',
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 20,
                                                color: appColors.appBasic,
                                              )),
                                        ),
                                        Text('Book: $bookslug \n',
                                            style: const TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w300)),
                                        Text(
                                          'Hadith Number: ${hadith.hadithNumber} \n',
                                          style: const TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          '"${hadith.hadithEnglish}"',
                                          style: const TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                      ],
                                    ),
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void calculate() {
  final jHijri = JHijri.now();
  String digitsBetweenDashes = '';
  String digitsBeforeFirstDash = '';
  String digitsAfterSecondDash = '';
  String? monthName;

  String inputString = jHijri.fullDate;

  RegExp regExp = RegExp(r'(\d+)-(\d+)-(\d+)');

  Match? match = regExp.firstMatch(inputString) as Match?;

  if (match != null) {
    digitsBeforeFirstDash = match.group(1)!;
    digitsBetweenDashes = match.group(2)!;
    digitsAfterSecondDash = match.group(3)!;
  } else {
    print("No match found");
  }

  switch (int.parse(digitsBetweenDashes)) {
    case 1:
      monthName = 'Muharram';
      break;

    case 2:
      monthName = 'Safar';
      break;

    case 3:
      monthName = 'Rabi al-Awwal';
      break;

    case 4:
      monthName = 'Rabi al-Thani';
      break;

    case 5:
      monthName = 'Jumada al-Awwal';
      break;

    case 6:
      monthName = 'Jumada al-Thani';
      break;

    case 7:
      monthName = 'Rajab';
      break;

    case 8:
      monthName = 'Shaban';
      break;

    case 9:
      monthName = 'Ramadan';
      break;

    case 10:
      monthName = 'Shawwal';
      break;

    case 11:
      monthName = 'Dhu al-Qadah';
      break;

    case 12:
      monthName = 'Dhu al-Hijjah';
      break;
  }

  islamicDate =
      digitsBeforeFirstDash + ' ' + monthName! + ' ' + digitsAfterSecondDash;

  print(islamicDate);

  int randomBook = Random().nextInt(6) + 1;

  switch (randomBook) {
    case 1:
      bookslug = 'sahih-bukhari';
      number = Random().nextInt(56) + 1;
      break;
    case 2:
      bookslug = 'sahih-muslim';
      number = Random().nextInt(56) + 1;
      break;
    case 3:
      bookslug = 'al-tirmidhi';
      number = Random().nextInt(48) + 1;
      break;
    case 4:
      bookslug = 'abu-dawood';
      number = Random().nextInt(43) + 1;
      break;
    case 5:
      bookslug = 'ibn-e-majah';
      number = Random().nextInt(39) + 1;
      break;
    case 6:
      bookslug = 'sunan-nasai';
      number = Random().nextInt(52) + 1;
      break;
    default:
      print("Random number is out of range");
  }
}

Future<List<Hadith>> fetchData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int lastFetchTime = prefs.getInt('lastFetchTime') ?? 0;

  if (DateTime.now().millisecondsSinceEpoch - lastFetchTime > 24 * 60 * 60 * 1000) {
    var apiKey = '\$2y\$10\$EKIdJOrdsb3yxKEZYyWlte2WdRm8R0rtGJYiTGRKvm1ZvWhz39e';
    var response = await http.get(Uri.parse(
        "https://hadithapi.com/public/api/hadiths?apiKey=$apiKey&book=$bookslug&chapter=$number&paginate=1"));

    if (response.statusCode == 200) {
      final dynamic responseData = jsonDecode(response.body);

      List datalist = responseData["hadiths"]["data"];

      hadithList = datalist.map((element) => Hadith.fromJson(element)).toList();

      prefs.setInt('lastFetchTime', DateTime.now().millisecondsSinceEpoch);

      return hadithList;
    } else {
      throw Exception('Failed to load');
    }
  } else {
    return hadithList;
  }
}



void nextCalculate() {
  DateTime now = DateTime.now();

  List<String> prayerNames = ['Fajr', 'Dhuhr', 'Asr', 'Maghrib', 'Isha'];

  List<DateTime> prayerTimes2 = [
    prayerTimesFirst!['fajrTime'],
    prayerTimesFirst!['dhuhrTime'],
    prayerTimesFirst!['asrTime'],
    prayerTimesFirst!['maghribTime'],
    prayerTimesFirst!['ishaTime'],
  ];

  for (int i = 0; i < prayerTimes2.length; i++) {
    if (now.isBefore(prayerTimes2[i])) {
      print(prayerNames[i]);
      nextPrayerName = prayerNames[i];
      nextPrayerTime = formatTime(prayerTimes2[i]);
      nextRemainingTime = prayerTimes2[i];
      break;
    } else if (i == prayerTimes2.length - 1) {
      nextPrayerName = prayerNames[0]; 
      nextPrayerTime = formatTime(prayerTimesFirst!['fajrTime']
          .add(Duration(days: 1))); 
      nextRemainingTime = prayerTimesFirst!['fajrTime'].add(Duration(days: 1));
    }
  }
}


String formatTime(DateTime dateTime) {
  String amPm = dateTime.hour < 12 ? 'AM' : 'PM';
  int hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
  return '$hour:${dateTime.minute.toString().padLeft(2, '0')} $amPm';
}
