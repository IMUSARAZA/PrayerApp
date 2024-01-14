import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jhijri/jHijri.dart';
import 'package:prayerapp/CountdownTimerWidget.dart';
import 'package:prayerapp/Hadith.dart';
import 'package:prayerapp/SignUpData.dart';
import 'package:prayerapp/compass/loading_indicator.dart';
import 'package:prayerapp/const/appColors.dart';
import 'package:prayerapp/main.dart';
import 'package:prayerapp/services/Database_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class homePage extends StatefulWidget {
  final String? userLocation;
  const homePage({this.userLocation, Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

var bookslug = 'sahih-bukhari';
var number = 5;
String? nextPrayerName, nextPrayerTime, islamicDate;
DateTime? nextRemainingTime;
Duration remainingTime = Duration.zero;
List<Hadith> hadithList = [];

class _homePageState extends State<homePage> {
  DatabaseService _databaseService = DatabaseService();
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
    updateRemainingTime();
    loadPrayerData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void loadPrayerData() async {
    // String userId = loggedInUserID!;
    String userId = 'musarazach@gmail.com';
    
    
    DateTime endDate = DateTime.now();
    DateTime startDate = endDate.subtract(Duration(days: 1));

    List<Map<String, dynamic>> prayerData =
        await _databaseService.getPrayerDataInDateRange(userId, startDate, endDate);

        // print(prayerData);

    updateUIWithPrayerData(prayerData);

  }


  

  void updateUIWithPrayerData(List<Map<String, dynamic>> prayerData) {
  for (var data in prayerData) {
    String? prayerName = data['prayerName'];
    bool isOffered = data['isOffered'];
    DateTime storedDate = (data['date'] as Timestamp).toDate();

    if (prayerName != null && isSameDay(DateTime.now(), storedDate)) {
      updateCheckboxState(prayerName, isOffered);
    }
  }
}

void updateCheckboxState(String? prayerName, bool isOffered) {
  if (prayerName == null) {
    return; // handle the case where prayerName is null
  }

  switch (prayerName) {
    case 'Fajr':
      setState(() {
        isCheckedbox = isOffered;
        checkColor = isOffered ? appColors.appBasic : appColors.appBasic;
      });
      break;
    case 'Zuhar':
      setState(() {
        isCheckedbox = isOffered;
        checkColor = isOffered ? appColors.appBasic : appColors.appBasic;
      });
      break;
    case 'Asr':
      setState(() {
        isCheckedbox = isOffered;
        checkColor = isOffered ? appColors.appBasic : appColors.appBasic;
      });
      break;
    case 'Maghrib':
      setState(() {
        isCheckedbox = isOffered;
        checkColor = isOffered ? appColors.appBasic : appColors.appBasic;
      });
      break;
    case 'Isha':
      setState(() {
        isCheckedbox = isOffered;
        checkColor = isOffered ? appColors.appBasic : appColors.appBasic;
      });
      break;
  }
}


  bool isSameDay(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}

  void savePrayerData(String prayerName, bool isOffered) async {
    String userId = 'musarazach@gmail.com';
    await _databaseService.addPrayerData(
      userId: userId,
      prayerName: prayerName,
      isOffered: isOffered,
    );
  }

  

  void updateRemainingTime() {
    DateTime now = DateTime.now();
    if (nextRemainingTime == null) {
      return;
    }
    remainingTime = calculateRemainingTime();
  }

  Duration calculateRemainingTime() {
    DateTime now = DateTime.now();
    if (nextRemainingTime == null) {
      return Duration.zero;
    }
    return nextRemainingTime!.difference(now);
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
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 0, 10),
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                child: Container(
                                  width: 100,
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
                                            setState(() {
                                              isCheckedbox = value;
                                              checkColor = value!
                                                  ? appColors.appBasic
                                                  : const Color.fromARGB(
                                                      255, 45, 38, 38);
                                            });
                                            savePrayerData(
                                                nextPrayerName!, value!);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(130, 0, 0, 0),
                                child: CountdownTimerWidget(
                                    duration: remainingTime),
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
                          color: Colors.white,
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

    if (DateTime.now().millisecondsSinceEpoch - lastFetchTime >
        24 * 60 * 60 * 1000) {
      var apiKey =
          '\$2y\$10\$EKIdJOrdsb3yxKEZYyWlte2WdRm8R0rtGJYiTGRKvm1ZvWhz39e';
      var response = await http.get(Uri.parse(
          "https://hadithapi.com/public/api/hadiths?apiKey=$apiKey&book=$bookslug&chapter=$number&paginate=1"));

      if (response.statusCode == 200) {
        final dynamic responseData = jsonDecode(response.body);

        List datalist = responseData["hadiths"]["data"];

        hadithList =
            datalist.map((element) => Hadith.fromJson(element)).toList();

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
        nextPrayerTime =
            formatTime(prayerTimesFirst!['fajrTime'].add(Duration(days: 1)));
        nextRemainingTime =
            prayerTimesFirst!['fajrTime'].add(Duration(days: 1));
      }
    }
  }

  String formatTime(DateTime dateTime) {
    String amPm = dateTime.hour < 12 ? 'AM' : 'PM';
    int hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
    return '$hour:${dateTime.minute.toString().padLeft(2, '0')} $amPm';
  }
}