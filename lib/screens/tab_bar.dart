import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:next_class/data/timetable.dart';

import '../data/slot.dart';

class WhatsAppBar extends StatelessWidget {


  final int today;
  final List<Slot> events;
  var brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;


  WhatsAppBar({required this.today,required this.events});

  @override
  Widget build(BuildContext context) {

    bool isDark = brightness == Brightness.dark;
    final List<Widget> screens = [
      MondayTimeTable(selectedDay: 1,events: events,),
      MondayTimeTable(selectedDay: 2,events: events,),
      MondayTimeTable(selectedDay: 3,events: events,),
      MondayTimeTable(selectedDay: 4,events: events,),
      MondayTimeTable(selectedDay: 5,events: events,),
      MondayTimeTable(selectedDay: 6, events: events),
    ];
    final now = DateTime.now();
    final currentDayOfWeek = now.weekday % 7;
    return DefaultTabController(

      initialIndex: (currentDayOfWeek == 6 || currentDayOfWeek == 0 ) ? 4 : today,
      length: 6,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: isDark ? Colors.black : Colors.white,

          title: Row(
            children: [
              Image.asset('assets/nextClass.png',height: 40,width: 40,),
              SizedBox(width: 20,),
              Center(child: Text('Time Table',style: TextStyle(color: isDark ? Colors.white : Colors.black),)),
            ],
          ),
          bottom: TabBar(
            unselectedLabelColor: isDark ? Colors.white : Colors.black38,

            tabs: [
              Tab(text: 'Mon'),
              Tab(text: 'Tue'),
              Tab(text: 'Wed'),
              Tab(text: 'Thu',),
              Tab(text: 'Fri',),
              Tab(text: 'Sat',),
            ],
          ),
        ),
        body: TabBarView(
          children: screens,
        ),
      ),
    );
  }
}

