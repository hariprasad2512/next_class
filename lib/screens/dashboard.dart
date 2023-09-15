import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:next_class/data/notification_api.dart';
import 'package:next_class/data/slot.dart';
import 'package:next_class/data/timetable.dart';
import 'loadingScreen.dart';
import 'login_screen.dart';
import 'package:timezone/data/latest.dart' as tz;

class NextEventScreen extends StatefulWidget {
  final List<Slot> events;
  final int selectedDay;

  NextEventScreen({required this.events, required this.selectedDay});

  @override
  State<NextEventScreen> createState() => _NextEventScreenState();
}

class _NextEventScreenState extends State<NextEventScreen> {

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Slot? getNextEvent(List<Slot> events) {
    final now = DateTime.now();
    //final now = DateTime(DateTime.now().
    // year, DateTime.now().month, DateTime.now().day, 14, 50);

    final currentDayOfWeek = now.weekday % 7;

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

  var brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;

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

  NotificationServices notificationServices= NotificationServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tz.initializeTimeZones();
    notificationServices.initialiseNotifications();
  }
  @override
  Widget build(BuildContext context) {
    bool isDark = brightness == Brightness.dark;

    Future<void> _handleLogOut() async {
      try {
        await FirebaseAuth.instance.signOut();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen(events: widget.events,)),
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
          Navigator.push(context, MaterialPageRoute(builder: (context)=> MondayTimeTable(selectedDay: widget.selectedDay, events: widget.events,)));
          break;
        case 1:
          _handleLogOut();
          break;
      }
    }

    final now = DateTime.now();
    final currentDayOfWeek = now.weekday;

    if (currentDayOfWeek % 7 == 0) {  //Sunday
      return Scaffold(
        backgroundColor: isDark ? Colors.black : Colors.white,
        appBar: AppBar(
          title: Text('Next Class',style: TextStyle(color: isDark ? Colors.white : Colors.black),),
          backgroundColor: isDark ? Colors.black : Colors.white,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
        decoration: BoxDecoration(
        color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black54, spreadRadius: 5)],
        ),
        child: CircleAvatar(
          radius: 180,
          backgroundImage: AssetImage('assets/dance.jpeg'),
        ),
      ),


            SizedBox(height: 20,),// Replace with your weekend image asset
            Center(
              child: Text(
                'Have a great weekend!',
                style: GoogleFonts.dancingScript(fontSize: 38,fontWeight: FontWeight.bold,color: isDark ? Colors.white : Colors.black),
              ),
            ),
          ],
        ),
      );
    }

    return FutureBuilder<List<bool?>>(
        future: getEnrollmentStatus(widget.events, widget.selectedDay),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Splash();
          } else if (snapshot.hasError) {
            return const Text('Error loading data');
          } else {
            //final enrollmentStatusList = snapshot.data ?? List.generate(events.length, (_) => false);
            final enrollmentStatusList =
                snapshot.data ?? List.generate(widget.events.length, (_) => false);

            // Filter enrolled events
            // final enrolledEvents = events
            //     .whereIndexed((index, event) => enrollmentStatusList[index]!);
            final enrolledEvents = widget.events.whereIndexed((index, event) {
              return enrollmentStatusList[index]! &&
                  event.recurrenceDays.contains(widget.selectedDay);
            });

            print(enrolledEvents);
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
                backgroundColor: Colors.transparent,
                elevation: 20,
                child: Container(
                  height: 350.0,
                  width: 350.0,


                  child:InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Card(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: RadialGradient( colors: [Color(0xff163f62), Color(0xff1c1c1e)], stops: [0.2, 1], center: Alignment.center, ),
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Icons.close,color: Colors.white,),
                                SizedBox(width: 30),
                              ],
                            ),
                            Text(currentEvent!.eventName, style: GoogleFonts.tiltPrism(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('${convertTo12HourFormat(currentEvent.startTime)}',
                                  style: TextStyle(fontSize: 25,color: Color(0xFFEFEEEA)),),
                                SizedBox(width: 20,),
                                Text('${convertTo12HourFormat(currentEvent.endTime)}',
                                  style: TextStyle(fontSize: 25,color: Color(0xFFEFEEEA)),),
                              ],
                            ),
                            Text('Room: ${currentEvent.roomNumber}',style: TextStyle(fontSize: 25,color: Color(0xFFEFEEEA)),),
                          ],
                        ),
                      ),
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


            print("Enrolled Events are as follows : ");
            print(enrolledEvents);
            return enrolledEvents.isNotEmpty ?
            Scaffold(
              appBar: AppBar(
                backgroundColor: isDark ? Colors.black45 : Colors.white,
                title: Row(
                    children: [
                      Image.asset('assets/nextClass.png',height: 40,width: 40,),
                      SizedBox(width: 20,),
                      Center(child: Text('nextClass',style: TextStyle(color: isDark ? Colors.white : Colors.black),)),
                    ],
              ),),
              backgroundColor: isDark ? Colors.black54 : Colors.white,
              body: Column(
                mainAxisAlignment: nextEvent != null ? MainAxisAlignment.end : MainAxisAlignment.center,
                children: [

                  SizedBox(
                    child: currentEvent != null ? ElevatedButton(onPressed: (){
                      _scaleDialog();
                    },child: Text('Current Class'),) : Container(),
                  ),
                  Center(
                    child: nextEvent != null
                        ? Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 50,),
                                Card(
                      color: Colors.blueAccent,
                                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                                  Text(nextEvent.eventName, style: GoogleFonts.tiltPrism(color: Colors.white,fontSize: 65,fontWeight: FontWeight.bold)),
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

                              ],
                            ),
                            Image.asset('assets/boy_coding.png',width: 300,height: 300,),
                          ],
                        )
                          : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 10,
                                color: Colors.lightBlue.shade200,
                                child: SizedBox(
                                  height: 300,
                                    child: Center(child: Text('No upcoming classes today',style: GoogleFonts.montserrat(fontSize: 30,color: Colors.white),textAlign: TextAlign.center,)))),
                          ),
                  ),
                ],
              ),
            ) : Scaffold(
              appBar: AppBar(
                title: Text('Next Class'),
              ),
              body: Column(
                children: [
                  Image.asset('assets/building.gif'),
                  Center(
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Text(
                            'Looks like no classes',style: TextStyle(fontSize: 20),),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}