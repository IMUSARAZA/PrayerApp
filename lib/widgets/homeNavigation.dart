import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:prayerapp/MasjidLocator.dart';
import 'package:prayerapp/PrayerTimeCalculation.dart';
import 'package:prayerapp/const/appColors.dart';
import 'package:prayerapp/homePage.dart';
import 'package:prayerapp/moreSettings.dart';
import 'package:prayerapp/prayerRecordScreen.dart';
import 'package:prayerapp/qiblaFinder.dart';
import 'package:shared_preferences/shared_preferences.dart';

// late Map<String, dynamic>? prayerTimesFirst;

String? loggedInUser = FirebaseAuth.instance.currentUser!.email!;

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await SharedPreferences.getInstance();
  // prayerTimesFirst = await PrayerTimeCalculation.calculatePrayerTimes();
  runApp(homeNavigation("Lahore"));
}

class homeNavigation extends StatefulWidget {
  final String location;
  const homeNavigation(this.location, {Key? key}) : super(key: key);

  @override
  State<homeNavigation> createState() => _homeNavigationState();
}

class _homeNavigationState extends State<homeNavigation> {
  int _selectedIndex = 0;
  late homePage _homePage;
  late MapPage _mapPage;
  late moreSettings _moreSettingsPage;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    _homePage = homePage(userLocation: widget.location);
    _mapPage = MapPage(position!.latitude, position!.longitude);
    _moreSettingsPage = moreSettings();

    final screens = [
      _homePage,
      const PrayerRecordScreen(),
      const qiblaFinder(),
      _mapPage,
      _moreSettingsPage,
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: screens[_selectedIndex],
        appBar: AppBar(
          shadowColor: const Color(0xffe1ba2d),
          leading: const SizedBox(),
          backgroundColor: appColors.appBasic,
          title: const Center(
            child: Text(
              'Iman Insight',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.person),
              color: const Color(0xFF4137BD),
              iconSize: 30,
              onPressed: () {
                // Handle settings action
              },
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 75,
          width: screenWidth,
          decoration: const BoxDecoration(
            color: appColors.appBasic,
            border: Border(
              top: BorderSide(
                color: appColors.appBasic,
                width: 1,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(FlutterIslamicIcons.prayingPerson),
                  label: 'Prayer Record',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.compass),
                  label: 'Qibla',
                ),
                BottomNavigationBarItem(
                  icon: Icon(FlutterIslamicIcons.mosque),
                  label: 'Masjid Locator',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: 'More',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: appColors.appBasic,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
