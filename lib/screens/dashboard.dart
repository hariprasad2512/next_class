import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:next_class/data/slot.dart';
import 'package:next_class/data/timetable.dart';
import 'package:next_class/screens/branch_page.dart';

import 'loadingScreen.dart';
import 'login_screen.dart';

class NextEventScreen extends StatelessWidget {
  final List<Slot> events;
  final int selectedDay;

  NextEventScreen({required this.events, required this.selectedDay});

  Slot? getNextEvent(List<Slot> events) {
    final now = DateTime.now();
    //final now = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 14, 50);

    final currentDayOfWeek = now.weekday;

    // Filter events that have recurrenceDays matching the current day
    final recurringEventsToday = events.where((event) =>
        event.recurrenceDays.contains(currentDayOfWeek)).toList();

    // Filter events that have not passed their end time today
    final upcomingEvents = recurringEventsToday.where((event) {
      final startTime = DateTime(now.year, now.month, now.day,
          int.parse(event.startTime.split(':')[0]),
          int.parse(event.startTime.split(':')[1]));
      final endTime = DateTime(
          now.year, now.month, now.day, int.parse(event.endTime.split(':')[0]),
          int.parse(event.endTime.split(':')[1]));
      return now.isBefore(startTime);
    }).toList();

    // Sort the upcoming events by their start time
    upcomingEvents.sort((a, b) {
      final startTimeA = DateTime(
          now.year, now.month, now.day, int.parse(a.startTime.split(':')[0]),
          int.parse(a.startTime.split(':')[1]));
      final startTimeB = DateTime(
          now.year, now.month, now.day, int.parse(b.startTime.split(':')[0]),
          int.parse(b.startTime.split(':')[1]));
      return startTimeA.compareTo(startTimeB);
    });

    return upcomingEvents.isNotEmpty ? upcomingEvents.first : null;
  }


  Future<List<bool?>> getEnrollmentStatus(List<Slot> events,
      int selectedDay) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) return List.generate(events.length, (_) => false);

    final userRef = FirebaseFirestore.instance.collection('users').doc(
        currentUser.uid);
    final userSnapshot = await userRef.get();

    if (!userSnapshot.exists) return List.generate(events.length, (_) => false);

    final userData = userSnapshot.data();
    final selectedSubjects = userData?['selectedSubjects'] as List<dynamic>?;

    if (selectedSubjects == null)
      return List.generate(events.length, (_) => false);

    // Map events to their enrollment status based on the selected day
    final enrollmentStatusMap = Map<String, bool>.fromIterables(
      events.map((event) => event.eventName),
      List.generate(events.length, (_) => false),
    );

    for (int i = 0; i < events.length; i++) {
      final event = events[i];
      if (event.recurrenceDays.contains(selectedDay)) {
        enrollmentStatusMap[event.eventName] =
            selectedSubjects.contains(event.eventName);
      }
    }

    return events.map((event) => enrollmentStatusMap[event.eventName]).toList();
  }

  var todayEvents = [];

  @override
  Widget build(BuildContext context) {

    Future<void> _handleLogOut() async {
      try {
        await FirebaseAuth.instance.signOut();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
              (route) => false,
        );
      } catch (e) {
        print('Error logging out: $e');
      }
    }

    String convertTo12HourFormat(String time) {
      int hour = int.parse(time.split(':')[0]);
      int minute = int.parse(time.split(':')[1]);

      String period = hour >= 12 ? 'PM' : 'AM';

      if (hour > 12) {
        hour -= 12;
      }

      return '$hour:${minute.toString().padLeft(2, '0')} $period';
    }


    void handleClick(int item) {
      switch (item) {
        case 0:
          Navigator.push(context, MaterialPageRoute(builder: (context)=> MondayTimeTable(selectedDay: selectedDay,)));
          break;
        case 1:
          _handleLogOut();
          break;
      }
    }

    return FutureBuilder<List<bool?>>(
        future: getEnrollmentStatus(events, selectedDay),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Splash();
          } else if (snapshot.hasError) {
            return const Text('Error loading data');
          } else {
            //final enrollmentStatusList = snapshot.data ?? List.generate(events.length, (_) => false);
            final enrollmentStatusList =
                snapshot.data ?? List.generate(events.length, (_) => false);

            // Filter enrolled events
            // final enrolledEvents = events
            //     .whereIndexed((index, event) => enrollmentStatusList[index]!);
            final enrolledEvents = events.whereIndexed((index, event) {
              return enrollmentStatusList[index]! &&
                  event.recurrenceDays.contains(selectedDay);
            });
            final nextEvent = getNextEvent(enrolledEvents);

            Slot? findOngoingEvent(List<Slot> events) {
              final now = DateTime.now();

              for (final event in events) {
                final eventStartTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  int.parse(event.startTime.split(':')[0]),
                  int.parse(event.startTime.split(':')[1]),
                );
                final eventEndTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  int.parse(event.endTime.split(':')[0]),
                  int.parse(event.endTime.split(':')[1]),
                );

                if (now.isAfter(eventStartTime) && now.isBefore(eventEndTime)) {
                  return event; // Return the ongoing event
                }
              }

              return null; // No ongoing event found
            }

            var currentEvent = findOngoingEvent(enrolledEvents);

            todayEvents = enrolledEvents;

            Widget _dialog(BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
                child: Container(
                  height: 300.0,
                  width: 300.0,

                  child:InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(currentEvent!.eventName, style: TextStyle(
                            fontSize: 75),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${convertTo12HourFormat(currentEvent.startTime)}',
                              style: TextStyle(fontSize: 25),),
                            SizedBox(width: 20,),
                            Text('${convertTo12HourFormat(currentEvent.endTime)}',
                              style: TextStyle(fontSize: 25),),
                          ],
                        ),
                        Text('Room: ${currentEvent.roomNumber}',style: TextStyle(fontSize: 25),),
                      ],
                    ),
                  ),
                ),
              );
            }

            void _scaleDialog() {
              showGeneralDialog(
                context: context,
                pageBuilder: (ctx, a1, a2) {
                  return Container();
                },
                transitionBuilder: (ctx, a1, a2, child) {
                  var curve = Curves.easeInOut.transform(a1.value);
                  return Transform.scale(
                    scale: curve,
                    child: _dialog(ctx),
                  );
                },
                transitionDuration: const Duration(milliseconds: 300),
              );
            }



            return enrolledEvents.isNotEmpty ?
            Scaffold(
              appBar: AppBar(
                title: Text('Next Class'),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(
                    child: currentEvent != null ? ElevatedButton(onPressed: (){
                      _scaleDialog();
                    },child: Text('Current Class'),) : Container(),
                  ),
                  Center(
                    child: nextEvent != null
                        ? Column(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 50,),
                               Card(
                      color: Colors.blueAccent,
                              child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                              Text(nextEvent.eventName, style: TextStyle(fontSize: 75,color: Colors.white),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                              Text('${convertTo12HourFormat(nextEvent.startTime)}',
                                style: TextStyle(fontSize: 25,color: Colors.white),),
                              SizedBox(width: 20,),
                              Text('${convertTo12HourFormat(nextEvent.endTime)}',
                                style: TextStyle(fontSize: 25,color: Colors.white),),
                                ],
                              ),
                              Text('Room: ${nextEvent.roomNumber}',style: TextStyle(fontSize: 25,color: Colors.white),),
                        SizedBox(height: 20),
                      ],
                    ),
                            ),
                            SizedBox(height: 200,),
                          ],
                        )
                          : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('No upcoming classes today',style: GoogleFonts.montserrat(fontSize: 30),textAlign: TextAlign.center,),
                          ),
                  ),
                ],
              ),
            ) : BranchSelection();
          }
        });
  }
}
