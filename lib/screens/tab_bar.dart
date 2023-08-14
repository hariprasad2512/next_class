import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:next_class/data/timetable.dart';

class WhatsAppBar extends StatelessWidget {
  final List<Widget> screens = [
    MondayTimeTable(selectedDay: 1),
    MondayTimeTable(selectedDay: 2),
    MondayTimeTable(selectedDay: 3),
    MondayTimeTable(selectedDay: 4),
    MondayTimeTable(selectedDay: 5),
  ];

  final int today;

  WhatsAppBar({required this.today});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: today,
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Time Table'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Mon'),
              Tab(text: 'Tue'),
              Tab(text: 'Wed'),
              Tab(text: 'Thu',),
              Tab(text: 'Fri',)
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

