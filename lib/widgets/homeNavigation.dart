import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:prayerapp/const/appColors.dart';
import 'package:prayerapp/homePage.dart';
import 'package:prayerapp/prayerRecordScreen.dart';
import 'package:prayerapp/qiblaFinder.dart';

void main() => runApp(const homeNavigation());

class homeNavigation extends StatefulWidget {
  const homeNavigation({super.key});

  @override
  State<homeNavigation> createState() => _homeNavigationState();
}

class _homeNavigationState extends State<homeNavigation> {
  int _selectedIndex = 0;

  final screens = [
    const homePage(),
    PrayerRecordScreen(),
    qiblaFinder(),
  ];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: screens[_selectedIndex],
        appBar: AppBar(
           shadowColor: const Color(0xffe1ba2d),
           leading:  IconButton(
            icon: const Icon(Icons.location_pin),
            color: const Color(0xFF4137BD),
            iconSize: 30,
            onPressed: () {
              
            },
           ),
          backgroundColor: appColors.appBasic,
          title: const Center
          (child: Text('Iman Insight',  
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
            icon: Icon(Icons.person),
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
