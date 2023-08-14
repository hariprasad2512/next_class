import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:next_class/data/timetable.dart';
import 'package:next_class/screens/almanac.dart';
import 'package:next_class/screens/dashboard.dart';
import 'package:next_class/screens/tab_bar.dart';
import 'package:next_class/screens/user_page.dart';

import '../data/slot.dart';


class BottomBarScreen extends StatefulWidget {
  BottomBarScreen(
      {super.key,
        this.selectedIndex, required this.events,
        });
  late int? selectedIndex;
  final List<Slot> events;
  
  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final List<Map<String, dynamic>> pages = [
    {'page': '', 'title': 'Home'},
    {'page': '', 'title': 'Timetable'},
    {'page': '', 'title': 'Almanac'},
    {'page': '', 'title': 'Your Account'},
  ];
  var brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;

  void changePage(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
  }

  int getDayOfWeekAsNumber(DateTime date) {
    return date.weekday % 7;
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int dayOfWeekAsNumber = getDayOfWeekAsNumber(now);
    bool isDarkMode = brightness == Brightness.dark;
    pages[0]['page'] = NextEventScreen(events: widget.events, selectedDay: dayOfWeekAsNumber);
    pages[1]['page'] = WhatsAppBar(today: dayOfWeekAsNumber-1,);
    pages[2]['page'] = Almanac();
    pages[3]['page'] = UserPage();


    int selectedIndexDef = widget.selectedIndex ?? 0;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(pages[selectedIndex]['title']),
      // ),
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: pages[selectedIndexDef]['page'],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: isDarkMode ? Colors.white : Colors.black54,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndexDef,
        onTap: (currentIndex) => {changePage(currentIndex)},
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house,
                ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.list,
                ),
            label: "Timetable",
          ),
          BottomNavigationBarItem(
            // icon: FaIcon(
            //   FontAwesomeIcons.list,
            // ),
            label: "Almanac",
            icon: FaIcon(FontAwesomeIcons.calendar,
                ),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.user,
                ),
            label: "My Account",
          ),
        ],
      ),
    );
  }
}
