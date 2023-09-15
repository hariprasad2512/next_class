import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:next_class/data/slot.dart';
import 'package:next_class/screens/branch_page.dart';
import 'package:next_class/screens/dashboard.dart';
import 'package:next_class/screens/loadingScreen.dart';
import 'package:next_class/screens/login_screen.dart';
import 'package:next_class/screens/subjects_page.dart';

class MondayTimeTable extends StatelessWidget {
  // Sample event objects with recurrenceDays
  final int selectedDay;
  final List<Slot> events;
  MondayTimeTable({required this.selectedDay,required this.events});
  Future<bool> isEnrolled(Slot event) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) return false;

    final userRef =
        FirebaseFirestore.instance.collection('users').doc(currentUser.uid);
    final userSnapshot = await userRef.get();

    if (!userSnapshot.exists) return false;

    final userData = userSnapshot.data();
    final selectedSubjects = userData?['selectedSubjects'] as List<dynamic>?;

    if (selectedSubjects == null) return false;

    return selectedSubjects.contains(event.eventName);
  }

  bool isEventCompleted(String endTime) {
    final now = DateTime.now();
    final eventEndTime = DateTime(now.year, now.month, now.day, int.parse(endTime.split(':')[0]), int.parse(endTime.split(':')[1]));
    return eventEndTime.isBefore(now);
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

  Future<List<bool?>> getEnrollmentStatus(List<Slot> events, int selectedDay) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) return List.generate(events.length, (_) => false);

    final userRef = FirebaseFirestore.instance.collection('users').doc(currentUser.uid);
    final userSnapshot = await userRef.get();

    if (!userSnapshot.exists) return List.generate(events.length, (_) => false);

    final userData = userSnapshot.data();
    final selectedSubjects = userData?['selectedSubjects'] as List<dynamic>?;

    if (selectedSubjects == null) return List.generate(events.length, (_) => false);

    // Map events to their enrollment status based on the selected day
    final enrollmentStatusMap = Map<String, bool>.fromIterables(
      events.map((event) => event.eventName),
      List.generate(events.length, (_) => false),
    );

    for (int i = 0; i < events.length; i++) {
      final event = events[i];
      if (event.recurrenceDays.contains(selectedDay)) {
        enrollmentStatusMap[event.eventName] = selectedSubjects.contains(event.eventName);
      }
    }

    return events.map((event) => enrollmentStatusMap[event.eventName]).toList();
  }

  // List<String> cse = ['FDFED 1','FDFED 2','FDFED 3','GTA','CC','DM','IR','CGM','CD','ICS 1','ICS 2','BTA','NLP','ML 1','ML 2','MIA','IDA'];
  // List<String> ece =['VLSI','DSP','PR','WC','MPMC','EP','ICPS'];
  var brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;

  final List<Color> cardColors = [
    Color(0xFF36474F),
    Colors.redAccent,
    Colors.blueAccent,
    Color(0xFF32AC71),
  Color(0xFF863995),
    Color(0xFFFE8A66),

    // Add more colors as needed...
  ];
  @override
  Widget build(BuildContext context) {
    bool isDark = brightness == Brightness.dark;



    Future<void> _handleLogOut() async {
      try {
        await FirebaseAuth.instance.signOut();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen(events: events,)),
              (route) => false,
        );
      } catch (e) {
        print('Error logging out: $e');
      }
    }


    List<Slot> todayEvents = [];


    // You can use a FutureBuilder to asynchronously build the UI based on the enrollment status
    return FutureBuilder<List<bool?>>(
        future: getEnrollmentStatus(events,selectedDay),
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
              return enrollmentStatusList[index]! && event.recurrenceDays.contains(selectedDay);
            });

            todayEvents = enrolledEvents;





            return enrolledEvents.isNotEmpty ? Scaffold(

            backgroundColor: isDark ? Colors.black : Colors.white,
              body: AnimationLimiter(
            child: ListView.builder(
            itemCount: enrolledEvents.length,
              itemBuilder: (BuildContext context, int index) {
                final event = enrolledEvents[index];
                final cardColor = cardColors[index % cardColors.length];
                final bool isCompleted = isEventCompleted(event.endTime);

                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 300),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: Card(
                        elevation: 20,
                        color: cardColor,
                        child: SizedBox(
                          height: 150,
                          child: ListTile(
                            title: Text(event.eventName,style: GoogleFonts.tiltPrism(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold)),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10,),
                                Text('Room: ${event.roomNumber}',style: TextStyle(color: Colors.white,fontSize: 15),),
                                Text('Time: ${convertTo12HourFormat(event.startTime)} - ${convertTo12HourFormat(event.endTime)}',style: TextStyle(color: Colors.white,fontSize: 15),),
                              ],
                            ),
                            onTap: () {
                              // Handle onTap event, e.g., navigate to event details
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
              // body: ListView.builder(
              //   physics: BouncingScrollPhysics(),
              //   itemCount: enrolledEvents.length,
              //   itemBuilder: (context, index) {
              //     final event = enrolledEvents[index];
              //     final cardColor = cardColors[index % cardColors.length];
              //     final bool isCompleted = isEventCompleted(event.endTime);
              //     return Card(
              //       elevation: 20,
              //       color: cardColor,
              //       child: SizedBox(
              //         height: 150,
              //         child: ListTile(
              //           title: Text(event.eventName,style: GoogleFonts.tiltPrism(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold)),
              //           subtitle: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               SizedBox(height: 10,),
              //               Text('Room: ${event.roomNumber}',style: TextStyle(color: Colors.white,fontSize: 15),),
              //               Text('Time: ${convertTo12HourFormat(event.startTime)} - ${convertTo12HourFormat(event.endTime)}',style: TextStyle(color: Colors.white,fontSize: 15),),
              //             ],
              //           ),
              //           onTap: () {
              //             // Handle onTap event, e.g., navigate to event details
              //           },
              //         ),
              //       ),
              //     );
              //   },
              // ),
            ) : Scaffold(
              backgroundColor: isDark ? Colors.black : Colors.white,
              body: Padding(
                  padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
            "Today is a holiday. Enjoy your day!",
            style: TextStyle(
            color: Colors.green, // Customize the color
            fontSize: 18,
            fontWeight: FontWeight.bold,
            ),
            ),
          ),
              )
          );
          }
        });
  }
}

extension IterableIndexed<E> on Iterable<E> {
  List<E> whereIndexed(bool Function(int index, E element) test) {
    final List<E> filteredList = [];
    int index = 0;
    for (final element in this) {
      if (test(index++, element)) {
        filteredList.add(element);
      }
    }
    return filteredList;
  }
}
