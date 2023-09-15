import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:next_class/screens/bottombar.dart';
import 'package:next_class/screens/login_screen.dart';
import 'data/firebase_api.dart';
import 'data/slot.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessagingService messagingService = FirebaseMessagingService();
  await messagingService.setupFirebaseMessaging();
  // For handling background notifications
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  int getDayOfWeekAsNumber(DateTime date) {
        return date.weekday % 7;
  }


  // SSHAM for UG 3

  final s1 = Slot(
    UG: 3,
    eventName: 'QRA 1',
    startTime: '08:30',
    endTime: '10:45',
    roomNumber: '115',
    enrolled: true, recurrenceDays: [6]
  );

  final s2 = Slot(
      UG: 3,
      eventName: 'SE UG3',
      startTime: '08:30',
      endTime: '10:45',
      roomNumber: '107',
      enrolled: true, recurrenceDays: [6]
  );

  final s3 = Slot(
      UG: 3,
      eventName: 'PGP UG3',
      startTime: '11:00',
      endTime: '13:00',
      roomNumber: '113',
      enrolled: true, recurrenceDays: [6]
  );

  final s4 = Slot(
      UG: 3,
      eventName: 'QIC',
      startTime: '11:00',
      endTime: '13:00',
      roomNumber: '115',
      enrolled: true, recurrenceDays: [6]
  );

  final s5 = Slot(
      UG: 3,
      eventName: 'QRA 3',
      startTime: '14:00',
      endTime: '16:00',
      roomNumber: '113',
      enrolled: true, recurrenceDays: [6]
  );

  final s6 = Slot(
    UG: 3,
    eventName: 'QRA 2',
    startTime: '16:00',
    endTime: '18:00',
    roomNumber: '103',
    enrolled: true,
    recurrenceDays: [5]
  );


  // SSHAM for UG 4

  final s7 = Slot(
      UG: 4,
      eventName: 'PGP UG4',
      startTime: '8:30',
      endTime: '11:00',
      roomNumber: '113',
      enrolled: true, recurrenceDays: [6]
  );

  final s8 = Slot(
      UG: 4,
      eventName: 'SE UG4',
      startTime: '11:00',
      endTime: '13:00',
      roomNumber: '107',
      enrolled: true, recurrenceDays: [6]
  );

  final s9 = Slot(
      UG: 4,
      eventName: 'IAE 1',
      startTime: '11:00',
      endTime: '13:00',
      roomNumber: 'Online',
      enrolled: true, recurrenceDays: [6]
  );

  final s10 = Slot(
      UG: 4,
      eventName: 'ITPM',
      startTime: '14:00',
      endTime: '16:00',
      roomNumber: 'Online',
      enrolled: true, recurrenceDays: [6]
  );

  final s11 = Slot(
      UG: 4,
      eventName: 'ICT',
      startTime: '16:00',
      endTime: '18:00',
      roomNumber: 'Online',
      enrolled: true, recurrenceDays: [6]
  );

  final s12 = Slot(
      UG: 4,
      eventName: 'IAE 2',
      startTime: '16:00',
      endTime: '18:00',
      roomNumber: 'Online',
      enrolled: true, recurrenceDays: [6]
  );


  final s13 = Slot(
    UG: 2,
    eventName: 'PC 1',
    startTime: '8:30',
    endTime: '10:45',
    roomNumber: '101',
    enrolled: true,
    recurrenceDays: [6]
  );

  final s14 = Slot(
      UG: 2,
      eventName: 'PC 2',
      startTime: '8:30',
      endTime: '10:45',
      roomNumber: '103',
      enrolled: true,
      recurrenceDays: [6]
  );

  final s15 = Slot(
      UG: 2,
      eventName: 'PC 3',
      startTime: '8:30',
      endTime: '10:45',
      roomNumber: '105',
      enrolled: true,
      recurrenceDays: [6]
  );


  // Old UGS

  final event1 = Slot(
    UG: 3,
    eventName: 'ICS 1',
    startTime: '08:45',
    endTime: '09:45',
    recurrenceDays: [1], roomNumber: '201', enrolled: true, // Occurs on Monday
  );

  final event2 = Slot(
    UG: 3,
    eventName: 'ICS 2',
    startTime: '08:45',
    endTime: '09:45',
    recurrenceDays: [1], roomNumber: '203', enrolled: true, // Occurs on Monday
  );

  final event3 = Slot(
    UG: 3,
    eventName: 'BTA',
    startTime: '08:45',
    endTime: '09:45',
    recurrenceDays: [1], roomNumber: '205', enrolled: true, // Occurs on Monday
  );
  final event4 = Slot(
    UG: 3,
    eventName: 'CD',
    startTime: '08:45',
    endTime: '09:45',
    recurrenceDays: [1], roomNumber: '207', enrolled: true, // Occurs on Monday
  );
  final event5 = Slot(
    UG: 3,
    eventName: 'WC',
    startTime: '08:45',
    endTime: '09:45',
    recurrenceDays: [1], roomNumber: '213', enrolled: true, // Occurs on Monday
  );
  final event6 = Slot(
    UG: 3,
    eventName: 'IDA UG3',
    startTime: '09:45',
    endTime: '10:45',
    recurrenceDays: [1], roomNumber: '107', enrolled: true, // Occurs on Monday
  );

  final event7 = Slot(
    UG: 3,
    eventName: 'DSP',
    startTime: '11:00',
    endTime: '12:00',
    recurrenceDays: [1], roomNumber: '105', enrolled: true, // Occurs on Monday
  );

  final event8 = Slot(
    UG: 3,
    eventName: 'CGM',
    startTime: '11:00',
    endTime: '12:00',
    recurrenceDays: [1], roomNumber: '207', enrolled: true, // Occurs on Monday
  );
  final event9 = Slot(
    UG: 3,
    eventName: 'CC 1',
    startTime: '12:00',
    endTime: '13:00',
    recurrenceDays: [1], roomNumber: '113', enrolled: true, // Occurs on Monday
  );
  final event10 = Slot(
    UG: 3,
    eventName: 'CC 2',
    startTime: '12:00',
    endTime: '13:00',
    recurrenceDays: [1], roomNumber: '115', enrolled: true, // Occurs on Monday
  );

  final event11 = Slot(
    UG: 3,
    eventName: 'GTA',
    startTime: '12:00',
    endTime: '13:00',
    recurrenceDays: [1], roomNumber: '201', enrolled: true, // Occurs on Monday
  );

  final event12 = Slot(
    UG: 3,
    eventName: 'MPMC',
    startTime: '12:00',
    endTime: '13:00',
    recurrenceDays: [1], roomNumber: '213', enrolled: true, // Occurs on Monday
  );

  final event13 = Slot(
    UG: 3,
    eventName: 'FDFED 1',
    startTime: '14:15',
    endTime: '15:15',
    recurrenceDays: [1], roomNumber: '107', enrolled: true, // Occurs on Monday
  );

  final event15 = Slot(
    UG: 3,
    eventName: 'FDFED 2',
    startTime: '15:15',
    endTime: '16:15',
    recurrenceDays: [1], roomNumber: '107', enrolled: true, // Occurs on Monday
  );
  final event14 = Slot(
    UG: 3,
    eventName: 'MPMC',
    startTime: '14:15',
    endTime: '17:30',
    recurrenceDays: [1], roomNumber: 'EC Lab2',
    enrolled: true, // Occurs on Monday
  );









  final event18 = Slot(
    UG: 3,
    eventName: 'FDFED 1',
    startTime: '08:45',
    endTime: '09:45',
    recurrenceDays: [2], roomNumber: '113', enrolled: true, // Occurs on tuesday
  );

  final event19 = Slot(
    UG: 3,
    eventName: 'FDFED 2',
    startTime: '08:45',
    endTime: '09:45',
    recurrenceDays: [2], roomNumber: '115', enrolled: true, // Occursontuesday
  );

  final event20 = Slot(
    UG: 3,
    eventName: 'FDFED 3',
    startTime: '08:45',
    endTime: '09:45',
    recurrenceDays: [2], roomNumber: 'C Lab', enrolled: true, // Occursontuesday
  );


  final event21 = Slot(
    UG: 3,
    eventName: 'ICS 1',
    startTime: '09:45',
    endTime: '10:45',
    recurrenceDays: [2], roomNumber: '201', enrolled: true, // Occursontuesday
  );

  final event37 = Slot(
    UG: 3,
    eventName: 'ICS 2',
    startTime: '09:45',
    endTime: '10:45',
    recurrenceDays: [2], roomNumber: '203', enrolled: true, // Occursontuesday
  );

  final event38 = Slot(
    UG: 3,
    eventName: 'BTA',
    startTime: '09:45',
    endTime: '10:45',
    recurrenceDays: [2], roomNumber: '215', enrolled: true, // Occursontuesday
  );



  final event22 = Slot(
    UG: 3,
    eventName: 'CD',
    startTime: '09:45',
    endTime: '10:45',
    recurrenceDays: [2], roomNumber: '211', enrolled: true, // Occursontuesday
  );



  final event24 = Slot(
    UG: 3,
    eventName: 'MIA',
    startTime: '11:00',
    endTime: '12:00',
    recurrenceDays: [2], roomNumber: '201', enrolled: true, // Occursontuesday
  );


  final event25 = Slot(
    UG: 3,
    eventName: 'DSP',
    startTime: '11:00',
    endTime: '12:00',
    recurrenceDays: [2], roomNumber: '113', enrolled: true, // Occursontuesday
  );


  final event26 = Slot(
    UG: 3,
    eventName: 'IDA UG3',
    startTime: '12:00',
    endTime: '13:00',
    recurrenceDays: [2], roomNumber: 'C Lab', enrolled: true, // Occursontuesday
  );


  final event28 = Slot(
    UG: 3,
    eventName: 'VLSI',
    startTime: '14:15',
    endTime: '15:15',
    recurrenceDays: [2], roomNumber: '105', enrolled: true, // Occursontuesday
  );

  final event29 = Slot(
    UG: 3,
    eventName: 'NLP',
    startTime: '14:15',
    endTime: '15:15',
    recurrenceDays: [2], roomNumber: '211', enrolled: true, // Occursontuesday
  );


  final event30 = Slot(
    UG: 3,
    eventName: 'ML 1',
    startTime: '14:15',
    endTime: '15:15',
    recurrenceDays: [2], roomNumber: '213', enrolled: true, // Occursontuesday
  );

  final event31 = Slot(
    UG: 3,
    eventName: 'ML 2',
    startTime: '14:15',
    endTime: '15:15',
    recurrenceDays: [2], roomNumber: '215', enrolled: true, // Occursontuesday
  );



  final event32 = Slot(
    UG: 3,
    eventName: 'DM',
    startTime: '15:15',
    endTime: '16:15',
    recurrenceDays: [2], roomNumber: '103', enrolled: true, // Occursontuesday
  );


  final event33 = Slot(
    UG: 3,
    eventName: 'PR',
    startTime: '15:15',
    endTime: '16:15',
    recurrenceDays: [2], roomNumber: '213', enrolled: true, // Occursontuesday
  );


  final event34 = Slot(
    UG: 3,
    eventName: 'CGM',
    startTime: '15:15',
    endTime: '16:15',
    recurrenceDays: [2], roomNumber: '207', enrolled: true, // Occursontuesday
  );


  final event35 = Slot(
    UG: 3,
    eventName: 'IR',
    startTime: '15:15',
    endTime: '16:15',
    recurrenceDays: [2], roomNumber: '107', enrolled: true, // Occursontuesday
  );



  final event36 = Slot(
    UG: 3,
    eventName: 'ICPS UG3',
    startTime: '16:30',
    endTime: '17:30',
    recurrenceDays: [2], roomNumber: '205', enrolled: true, // Occursontuesday
  );



  final event56 = Slot(
    UG: 3,
    eventName: 'ICS 1',
    startTime: '08:45',
    endTime: '09:45',
    recurrenceDays: [3],
    roomNumber: '201',
    enrolled: true, // Occurs on Wednesday
  );

  final event39 = Slot(
    UG: 3,
    eventName: 'ICS 2',
    startTime: '08:45',
    endTime: '09:45',
    recurrenceDays: [3],
    roomNumber: '203',
    enrolled: true, // Occurs on Wednesday
  );

  final event40 = Slot(
    UG: 3,
    eventName: 'BTA',
    startTime: '08:45',
    endTime: '09:45',
    recurrenceDays: [3],
    roomNumber: '205',
    enrolled: true, // Occurs on Wednesday
  );

  final event41 = Slot(
    UG: 3,
    eventName: 'CD',
    startTime: '08:45',
    endTime: '09:45',
    recurrenceDays: [3],
    roomNumber: '207',
    enrolled: true, // Occurs on Wednesday
  );

  final event42 = Slot(
    UG: 3,
    eventName: 'EP',
    startTime: '08:45',
    endTime: '09:45',
    recurrenceDays: [3],
    roomNumber: '211',
    enrolled: true, // Occurs on Wednesday
  );

  final event43 = Slot(
    UG: 3,
    eventName: 'IR',
    startTime: '09:45',
    endTime: '10:45',
    recurrenceDays: [3],
    roomNumber: '107',
    enrolled: true, // Occurs on Wednesday
  );

  final event44 = Slot(
    UG: 3,
    eventName: 'DM',
    startTime: '09:45',
    endTime: '10:45',
    recurrenceDays: [3],
    roomNumber: '113',
    enrolled: true, // Occurs on Wednesday
  );

  final event45 = Slot(
    UG: 3,
    eventName: 'PR',
    startTime: '09:45',
    endTime: '10:45',
    recurrenceDays: [3],
    roomNumber: '211',
    enrolled: true, // Occurs on Wednesday
  );

  final event46 = Slot(
    UG: 3,
    eventName: 'DSP',
    startTime: '11:00',
    endTime: '12:00',
    recurrenceDays: [3],
    roomNumber: '107',
    enrolled: true, // Occurs on Wednesday
  );

  final event47 = Slot(
    UG: 3,
    eventName: 'NLP',
    startTime: '11:00',
    endTime: '12:00',
    recurrenceDays: [3],
    roomNumber: '211',
    enrolled: true, // Occurs on Wednesday
  );

  final event48 = Slot(
    UG: 3,
    eventName: 'ML 1',
    startTime: '11:00',
    endTime: '12:00',
    recurrenceDays: [3],
    roomNumber: '213',
    enrolled: true, // Occurs on Wednesday
  );

  final event49 = Slot(
    UG: 3,
    eventName: 'ML 2',
    startTime: '11:00',
    endTime: '12:00',
    recurrenceDays: [3],
    roomNumber: '215',
    enrolled: true, // Occurs on Wednesday
  );

  final event50 = Slot(
    UG: 3,
    eventName: 'VLSI',
    startTime: '12:00',
    endTime: '13:00',
    recurrenceDays: [3],
    roomNumber: '115',
    enrolled: true, // Occurs on Wednesday
  );

  final event51 = Slot(
    UG: 3,
    eventName: 'MIA',
    startTime: '12:00',
    endTime: '13:00',
    recurrenceDays: [3],
    roomNumber: '215',
    enrolled: true, // Occurs on Wednesday
  );

  final event52 = Slot(
    UG: 3,
    eventName: 'CGM',
    startTime: '14:15',
    endTime: '15:15',
    recurrenceDays: [3],
    roomNumber: '211',
    enrolled: true, // Occurs on Wednesday
  );

  final event53 = Slot(
    UG: 3,
    eventName: 'FDFED 3',
    startTime: '15:15',
    endTime: '16:15',
    recurrenceDays: [3],
    roomNumber: '107',
    enrolled: true, // Occurs on Wednesday
  );

  final event54 = Slot(
    UG: 3,
    eventName: 'EP',
    startTime: '15:15',
    endTime: '16:15',
    recurrenceDays: [3],
    roomNumber: '211',
    enrolled: true, // Occurs on Wednesday
  );

  final event55 = Slot(
    UG: 3,
    eventName: 'ICPS UG3',
    startTime: '16:30',
    endTime: '17:30',
    recurrenceDays: [3],
    roomNumber: '205',
    enrolled: true, // Occurs on Wednesday
  );


  final event57 = Slot(
    UG: 3,
    eventName: 'DM',
    startTime: '08:45',
    endTime: '09:45',
    recurrenceDays: [4],
    roomNumber: '103',
    enrolled: true, // Occurs on Thursday
  );




  final event59 = Slot(
    UG: 3,
    eventName: 'PR',
    startTime: '09:45',
    endTime: '10:45',
    recurrenceDays: [4],
    roomNumber: '211',
    enrolled: true, // Occurs on Thursday
  );

  final event60 = Slot(
    UG: 3,
    eventName: 'NLP',
    startTime: '09:45',
    endTime: '10:45',
    recurrenceDays: [4],
    roomNumber: '213',
    enrolled: true, // Occurs on Thursday
  );



  final event61 = Slot(
    UG: 3,
    eventName: 'MIA',
    startTime: '09:45',
    endTime: '10:45',
    recurrenceDays: [4],
    roomNumber: '215',
    enrolled: true, // Occurs on Thursday
  );


  final event62 = Slot(
    UG: 3,
    eventName: 'CC 1',
    startTime: '11:00',
    endTime: '12:00',
    recurrenceDays: [4],
    roomNumber: '101',
    enrolled: true, // Occurs on Thursday
  );


  final event63 = Slot(
    UG: 3,
    eventName: 'CC 2',
    startTime: '11:00',
    endTime: '12:00',
    recurrenceDays: [4],
    roomNumber: '105',
    enrolled: true, // Occurs on Thursday
  );

  final event64 = Slot(
    UG: 3,
    eventName: 'GTA',
    startTime: '11:00',
    endTime: '12:00',
    recurrenceDays: [4],
    roomNumber: '203',
    enrolled: true, // Occurs on Thursday
  );

  final event65 = Slot(
    UG: 3,
    eventName: 'EP',
    startTime: '11:00',
    endTime: '12:00',
    recurrenceDays: [4],
    roomNumber: '211',
    enrolled: true, // Occurs on Thursday
  );


  final event66 = Slot(
    UG: 3,
    eventName: 'FDFED 1',
    startTime: '12:00',
    endTime: '13:00',
    recurrenceDays: [4],
    roomNumber: '113',
    enrolled: true, // Occurs on Thursday
  );


  final event67 = Slot(
    UG: 3,
    eventName: 'FDFED 2',
    startTime: '12:00',
    endTime: '13:00',
    recurrenceDays: [4],
    roomNumber: '115',
    enrolled: true, // Occurs on Thursday
  );


  final event68 = Slot(
    UG: 3,
    eventName: 'FDFED 3',
    startTime: '12:00',
    endTime: '13:00',
    recurrenceDays: [4],
    roomNumber: 'C Lab',
    enrolled: true, // Occurs on Thursday
  );


  final event83 = Slot(
    UG: 3,
    eventName: 'WC',
    startTime: '12:00',
    endTime: '13:00',
    recurrenceDays: [4],
    roomNumber: '213',
    enrolled: true, // Occurs on Thursday
  );


  final event841 = Slot(
    UG: 3,
    eventName: 'ML 1',
    startTime: '14:15',
    endTime: '17:30',
    recurrenceDays: [4],
    roomNumber: '215',
    enrolled: true, // Occurs on Thursday
  );


  final event84 = Slot(
    UG: 3,
    eventName: 'ML 2',
    startTime: '14:15',
    endTime: '17:30',
    recurrenceDays: [4],
    roomNumber: 'C Lab',
    enrolled: true, // Occurs on Thursday
  );


  final event69 = Slot(
    UG: 3,
    eventName: 'VLSI',
    startTime: '14:15',
    endTime: '15:15',
    recurrenceDays: [4],
    roomNumber: '113',
    enrolled: true, // Occurs on Thursday
  );

  final event70 = Slot(
    UG: 3,
    eventName: 'DSP',
    startTime: '15:15',
    endTime: '16:15',
    recurrenceDays: [4],
    roomNumber: '113',
    enrolled: true, // Occurs on Thursday
  );


  final event71 = Slot(
    UG: 3,
    eventName: 'ICPS UG3',
    startTime: '16:30',
    endTime: '17:30',
    recurrenceDays: [4],
    roomNumber: '205',
    enrolled: true, // Occurs on Thursday
  );




  final event73 = Slot(
    UG: 3,
    eventName: 'FDFED 1',
    startTime: '8:45',
    endTime: '12:00',
    recurrenceDays: [5],
    roomNumber: '113',
    enrolled: true, // Occurs on Friday
  );

  final event74 = Slot(
    UG: 3,
    eventName: 'FDFED 2',
    startTime: '8:45',
    endTime: '12:00',
    recurrenceDays: [5],
    roomNumber: '115',
    enrolled: true, // Occurs on Friday
  );

  final event75 = Slot(
    UG: 3,
    eventName: 'FDFED 3',
    startTime: '8:45',
    endTime: '12:00',
    recurrenceDays: [5],
    roomNumber: 'C Lab',
    enrolled: true, // Occurs on Friday
  );


  final event76 = Slot(
    UG: 3,
    eventName: 'CC 1',
    startTime: '12:00',
    endTime: '13:00',
    recurrenceDays: [5],
    roomNumber: '101',
    enrolled: true, // Occurs on Friday
  );

  final event761 = Slot(
    UG: 3,
    eventName: 'MPMC',
    startTime: '11:00',
    endTime: '12:00',
    recurrenceDays: [5],
    roomNumber: '215',
    enrolled: true, // Occurs on Friday
  );

  final event77 = Slot(
    UG: 3,
    eventName: 'CC 2',
    startTime: '12:00',
    endTime: '13:00',
    recurrenceDays: [5],
    roomNumber: '103',
    enrolled: true, // Occurs on Friday
  );

  final event78 = Slot(
    UG: 3,
    eventName: 'GTA',
    startTime: '12:00',
    endTime: '13:00',
    recurrenceDays: [5],
    roomNumber: '203',
    enrolled: true, // Occurs on Friday
  );


  final event79 = Slot(
    UG: 3,
    eventName: 'WC',
    startTime: '14:15',
    endTime: '15:15',
    recurrenceDays: [5],
    roomNumber: '213',
    enrolled: true, // Occurs on Friday
  );

  final event80 = Slot(
    UG: 3,
    eventName: 'IR',
    startTime: '14:15',
    endTime: '15:15',
    recurrenceDays: [5],
    roomNumber: '103',
    enrolled: true, // Occurs on Friday
  );

  final event81 = Slot(
    UG: 3,
    eventName: 'IDA UG3',
    startTime: '15:15',
    endTime: '16:15',
    recurrenceDays: [5],
    roomNumber: '101',
    enrolled: true, // Occurs on Friday
  );


  final event82 = Slot(
    UG: 3,
    eventName: 'VLSI',
    startTime: '16:30',
    endTime: '17:30',
    recurrenceDays: [5],
    roomNumber: '101',
    enrolled: true, // Occurs on Friday
  );
  final saturdayEvent = Slot(
    UG: 3,
    eventName: 'Happy Saturday',
    startTime: '13:00',
    endTime: '21:30',
    recurrenceDays: [6],
    roomNumber: 'Hostel',
    enrolled: true, // Occurs on Friday
  );



  // UG 4

  final event100 = Slot(
      eventName: 'BDA',
      startTime: '08:45',
      endTime: '09:45',
      recurrenceDays: [1], roomNumber: '209', enrolled: true, UG:4 // Occurs on Monday
  );


  final event102 = Slot(
      eventName: 'IDA UG4',
      startTime: '09:45',
      endTime: '10:45',
      recurrenceDays: [1], roomNumber: '107', enrolled: true, UG:4 // Occurs on Monday
  );

  final event103 = Slot(
      eventName: 'RL',
      startTime: '11:00',
      endTime: '12:00',
      recurrenceDays: [1], roomNumber: '209', enrolled: true, UG:4 // Occurs on Monday
  );

  final event104 = Slot(
      eventName: 'MERS',
      startTime: '14:15',
      endTime: '15:15',
      recurrenceDays: [1], roomNumber: '205', enrolled: true, UG:4 // Occurs on Monday
  );

  final event105 = Slot(
      eventName: 'DSD',
      startTime: '14:15',
      endTime: '15:15',
      recurrenceDays: [1], roomNumber: '207', enrolled: true, UG:4 // Occurs on Monday
  );

  final event106 = Slot(
      eventName: 'DIP',
      startTime: '16:30',
      endTime: '17:30',
      recurrenceDays: [1], roomNumber: '107', enrolled: true, UG:4 // Occurs on Monday
  );

  final event107 = Slot(
      eventName: 'SCEAI',
      startTime: '08:45',
      endTime: '09:45',
      recurrenceDays: [2], roomNumber: '209', enrolled: true, UG:4 // Occurs on Tuesday
  );

  final event108 = Slot(
      eventName: 'DTCA',
      startTime: '08:45',
      endTime: '09:45',
      recurrenceDays: [2], roomNumber: '211', enrolled: true, UG:4 // Occurs on Tuesday
  );

  final event109 = Slot(
      eventName: 'DSD',
      startTime: '09:45',
      endTime: '10:45',
      recurrenceDays: [2], roomNumber: '205', enrolled: true, UG:4 // Occurs on Tuesday
  );

  final event110 = Slot(
      eventName: 'MERS',
      startTime: '09:45',
      endTime: '10:45',
      recurrenceDays: [2], roomNumber: '207', enrolled: true, UG:4 // Occurs on Tuesday
  );

  final event111 = Slot(
      eventName: 'BDA',
      startTime: '11:00',
      endTime: '12:00',
      recurrenceDays: [2], roomNumber: '209', enrolled: true, UG:4 // Occurs on Tuesday
  );

  final event112 = Slot(
      eventName: 'IDA UG4',
      startTime: '12:00',
      endTime: '13:00',
      recurrenceDays: [2], roomNumber: 'C Lab', enrolled: true, UG:4 // Occurs on Tuesday
  );

  final event113 = Slot(
      eventName: 'RL',
      startTime: '14:15',
      endTime: '15:15',
      recurrenceDays: [2], roomNumber: '209', enrolled: true, UG:4 // Occurs on Tuesday
  );

  final event114 = Slot(
      eventName: 'VAR',
      startTime: '15:15',
      endTime: '16:15',
      recurrenceDays: [2], roomNumber: '105', enrolled: true, UG:4 // Occurs on Tuesday
  );

  final event115 = Slot(
      eventName: 'FQC',
      startTime: '15:15',
      endTime: '16:15',
      recurrenceDays: [2], roomNumber: '205', enrolled: true, UG:4 // Occurs on Tuesday
  );

  final event116 = Slot(
      eventName: 'IOT',
      startTime: '15:15',
      endTime: '16:15',
      recurrenceDays: [2], roomNumber: '215', enrolled: true, UG:4 // Occurs on Tuesday
  );

  final event117 = Slot(
      eventName: 'CRYPTO',
      startTime: '16:30',
      endTime: '17:30',
      recurrenceDays: [2], roomNumber: '103', enrolled: true, UG:4 // Occurs on Tuesday
  );

  final event118 = Slot(
      eventName: 'ICPS UG4',
      startTime: '16:30',
      endTime: '17:30',
      recurrenceDays: [2], roomNumber: '205', enrolled: true, UG:4 // Occurs on Tuesday
  );

  final eventUnique = Slot(
      eventName: 'SCEAI',
      startTime: '08:45',
      endTime: '09:45',
      recurrenceDays: [3], roomNumber: '209', enrolled: true, UG:4 // Occurs on Wednesday
  );

  final event119 = Slot(
      eventName: 'RL',
      startTime: '09:45',
      endTime: '10:45',
      recurrenceDays: [3], roomNumber: '209', enrolled: true, UG:4 // Occurs on Wednesday
  );

  final event120 = Slot(
      eventName: 'DSD',
      startTime: '11:00',
      endTime: '12:00',
      recurrenceDays: [3], roomNumber: '205', enrolled: true, UG:4 // Occurs on Wednesday
  );

  final event121 = Slot(
      eventName: 'MERS',
      startTime: '11:00',
      endTime: '12:00',
      recurrenceDays: [3], roomNumber: '207', enrolled: true, UG:4 // Occurs on Wednesday
  );

  final event122 = Slot(
      eventName: 'BDA',
      startTime: '12:00',
      endTime: '13:00',
      recurrenceDays: [3], roomNumber: '209', enrolled: true, UG:4 // Occurs on Wednesday
  );

  final event123 = Slot(
      eventName: 'DTCA',
      startTime: '12:00',
      endTime: '13:00',
      recurrenceDays: [3], roomNumber: '207', enrolled: true, UG:4 // Occurs on Wednesday
  );

  final event124 = Slot(
      eventName: 'DIP',
      startTime: '14:15',
      endTime: '15:15',
      recurrenceDays: [3], roomNumber: '107', enrolled: true, UG:4 // Occurs on Wednesday
  );

  final event125 = Slot(
      eventName: 'ICPS UG4',
      startTime: '16:30',
      endTime: '17:30',
      recurrenceDays: [3], roomNumber: '205', enrolled: true, UG:4 // Occurs on Wednesday
  );

  final event126 = Slot(
      eventName: 'DTCA',
      startTime: '15:15',
      endTime: '16:15',
      recurrenceDays: [3], roomNumber: '207', enrolled: true, UG:4 // Occurs on Wednesday
  );




  final event127 = Slot(
      eventName: 'VAR',
      startTime: '08:45',
      endTime: '09:45',
      recurrenceDays: [4], roomNumber: '107', enrolled: true, UG:4 // Occurs on Thursday
  );

  final event128 = Slot(
      eventName: 'IOT',
      startTime: '08:45',
      endTime: '09:45',
      recurrenceDays: [4], roomNumber: '205', enrolled: true, UG:4 // Occurs on Thursday
  );

  final event129 = Slot(
      eventName: 'FQC',
      startTime: '08:45',
      endTime: '09:45',
      recurrenceDays: [4], roomNumber: '207', enrolled: true, UG:4 // Occurs on Thursday
  );

  final event130 = Slot(
      eventName: 'CRYPTO',
      startTime: '16:30',
      endTime: '17:30',
      recurrenceDays: [4], roomNumber: '105', enrolled: true, UG:4 // Occurs on Thursday
  );

  final event131 = Slot(
      eventName: 'ICPS UG4',
      startTime: '16:30',
      endTime: '17:30',
      recurrenceDays: [4], roomNumber: '205', enrolled: true, UG:4 // Occurs on Thursday
  );



  final event132 = Slot(
      eventName: 'VAR',
      startTime: '12:00',
      endTime: '13:00',
      recurrenceDays: [5], roomNumber: '107', enrolled: true, UG:4 // Occurs on Friday
  );

  final event133 = Slot(
      eventName: 'FQC',
      startTime: '12:00',
      endTime: '13:00',
      recurrenceDays: [5], roomNumber: '205', enrolled: true, UG:4 // Occurs on Friday
  );

  final event134 = Slot(
      eventName: 'IOT',
      startTime: '12:00',
      endTime: '13:00',
      recurrenceDays: [5], roomNumber: '207', enrolled: true, UG:4 // Occurs on Friday
  );

  final event135 = Slot(
      eventName: 'CRYPTO',
      startTime: '14:15',
      endTime: '15:15',
      recurrenceDays: [5], roomNumber: '101', enrolled: true, UG:4 // Occurs on Friday
  );

  final event136 = Slot(
      eventName: 'IDA UG4',
      startTime: '15:15',
      endTime: '16:15',
      recurrenceDays: [5], roomNumber: '101', enrolled: true, UG:4 // Occurs on Friday
  );

  final event137 = Slot(
      eventName: 'DIP',
      startTime: '16:30',
      endTime: '17:30',
      recurrenceDays: [5], roomNumber: '101', enrolled: true, UG:4 // Occurs on Friday
  );



// UG-2




  final event201 = Slot(
    eventName: 'OS 2',
    startTime: '08:45',
    endTime: '09:45',
    recurrenceDays: [1],
    roomNumber: '103',
    enrolled: true,
    UG: 2, // Occurs on Monday
  );

  final event202 = Slot(
    eventName: 'OS 1',
    startTime: '08:45',
    endTime: '09:45',
    recurrenceDays: [1],
    roomNumber: '107',
    enrolled: true,
    UG: 2, // Occurs on Monday
  );

  final event203 = Slot(
    eventName: 'OS 1',
    startTime: '09:45',
    endTime: '10:45',
    recurrenceDays: [1],
    roomNumber: '103',
    enrolled: true,
    UG: 2, // Occurs on Monday
  );

  final event204 = Slot(
    eventName: 'CNA',
    startTime: '09:45',
    endTime: '13:00',
    recurrenceDays: [1],
    roomNumber: 'EC Lab-1,2',
    enrolled: true,
    UG: 2, // Occurs on Monday
  );



  final event206 = Slot(
    eventName: 'OS 3',
    startTime: '11:00',
    endTime: '12:00',
    recurrenceDays: [1],
    roomNumber: '103',
    enrolled: true,
    UG: 2, // Occurs on Monday
  );

  final event207 = Slot(
    eventName: 'RANAC 1',
    startTime: '14:15',
    endTime: '15:15',
    recurrenceDays: [1],
    roomNumber: '101',
    enrolled: true,
    UG: 2, // Occurs on Monday
  );

  final event208 = Slot(
    eventName: 'RANAC 2',
    startTime: '14:15',
    endTime: '15:15',
    recurrenceDays: [1],
    roomNumber: '103',
    enrolled: true,
    UG: 2, // Occurs on Monday
  );

  final event209 = Slot(
    eventName: 'RANAC 3',
    startTime: '14:15',
    endTime: '15:15',
    recurrenceDays: [1],
    roomNumber: '105',
    enrolled: true,
    UG: 2, // Occurs on Monday
  );

  final event210 = Slot(
    eventName: 'CS',
    startTime: '14:15',
    endTime: '15:15',
    recurrenceDays: [1],
    roomNumber: '201',
    enrolled: true,
    UG: 2, // Occurs on Monday
  );

  final event211 = Slot(
    eventName: 'ADSA 1',
    startTime: '15:15',
    endTime: '16:15',
    recurrenceDays: [1],
    roomNumber: '101',
    enrolled: true,
    UG: 2, // Occurs on Monday
  );

  final event212 = Slot(
    eventName: 'ADSA 2',
    startTime: '15:15',
    endTime: '16:15',
    recurrenceDays: [1],
    roomNumber: '103',
    enrolled: true,
    UG: 2, // Occurs on Monday
  );

  final event213 = Slot(
    eventName: 'ADSA 3',
    startTime: '15:15',
    endTime: '16:15',
    recurrenceDays: [1],
    roomNumber: '105',
    enrolled: true,
    UG: 2, // Occurs on Monday
  );

  final event214 = Slot(
    eventName: 'CNA',
    startTime: '15:15',
    endTime: '16:15',
    recurrenceDays: [1],
    roomNumber: '201',
    enrolled: true,
    UG: 2, // Occurs on Monday
  );

  final event215 = Slot(
    eventName: 'DBMS 1',
    startTime: '16:30',
    endTime: '17:30',
    recurrenceDays: [1],
    roomNumber: '101',
    enrolled: true,
    UG: 2, // Occurs on Monday
  );

  final event216 = Slot(
    eventName: 'DBMS 2',
    startTime: '16:30',
    endTime: '17:30',
    recurrenceDays: [1],
    roomNumber: '103',
    enrolled: true,
    UG: 2, // Occurs on Monday
  );

  final event217 = Slot(
    eventName: 'DBMS 3',
    startTime: '16:30',
    endTime: '17:30',
    recurrenceDays: [1],
    roomNumber: '105',
    enrolled: true,
    UG: 2, // Occurs on Monday
  );

  final event218 = Slot(
    eventName: 'RANAC 4',
    startTime: '16:30',
    endTime: '17:30',
    recurrenceDays: [1],
    roomNumber: '201',
    enrolled: true,
    UG: 2, // Occurs on Monday
  );

  final event219 = Slot(
      eventName: 'ADSA 1',
      startTime: '08:45',
      endTime: '09:45',
      recurrenceDays: [2], roomNumber: '101', enrolled: true, UG:2 // Occurs on Tuesday
  );

  final event220 = Slot(
      eventName: 'ADSA 3',
      startTime: '08:45',
      endTime: '09:45',
      recurrenceDays: [2], roomNumber: '105', enrolled: true, UG:2 // Occurs on Tuesday
  );

  final event221 = Slot(
      eventName: 'DBMS 1',
      startTime: '09:45',
      endTime: '10:45',
      recurrenceDays: [2], roomNumber: '115', enrolled: true, UG:2 // Occurs on Tuesday
  );

  final event222 = Slot(
      eventName: 'DBMS 2',
      startTime: '09:45',
      endTime: '10:45',
      recurrenceDays: [2], roomNumber: 'C LAB', enrolled: true, UG:2 // Occurs on Tuesday
  );

  final event223 = Slot(
      eventName: 'ES',
      startTime: '09:45',
      endTime: '13:00',
      recurrenceDays: [2], roomNumber: 'EC-Lab 1,2', enrolled: true, UG:2 // Occurs on Tuesday
  );



  final event225 = Slot(
      eventName: 'DBMS 3',
      startTime: '11:00',
      endTime: '12:00',
      recurrenceDays: [2], roomNumber: '115', enrolled: true, UG:2 // Occurs on Tuesday
  );



  final event226 = Slot(
      eventName: 'OS 1',
      startTime: '11:00',
      endTime: '12:00',
      recurrenceDays: [2], roomNumber: 'C LAB', enrolled: true, UG:2 // Occurs on Tuesday
  );

  final event227 = Slot(
      eventName: 'OOP 2',
      startTime: '11:00',
      endTime: '12:00',
      recurrenceDays: [2], roomNumber: '103', enrolled: true, UG:2 // Occurs on Tuesday
  );

  final event228 = Slot(
      eventName: 'OOP 3',
      startTime: '12:00',
      endTime: '13:00',
      recurrenceDays: [2], roomNumber: '115', enrolled: true, UG:2 // Occurs on Tuesday
  );

  final event229 = Slot(
      eventName: 'ADSA 1',
      startTime: '14:15',
      endTime: '17:30',
      recurrenceDays: [2], roomNumber: '113', enrolled: true, UG:2 // Occurs on Tuesday
  );

  final event230 = Slot(
      eventName: 'ADSA 2',
      startTime: '14:15',
      endTime: '17:30',
      recurrenceDays: [2], roomNumber: '115', enrolled: true, UG:2 // Occurs on Tuesday
  );

  final event231 = Slot(
      eventName: 'ADSA 3',
      startTime: '14:15',
      endTime: '17:30',
      recurrenceDays: [2], roomNumber: 'C LAB', enrolled: true, UG:2 // Occurs on Tuesday
  );

  final event232 = Slot(
      eventName: 'CS',
      startTime: '14:15',
      endTime: '15:15',
      recurrenceDays: [2], roomNumber: '201', enrolled: true, UG:2 // Occurs on Tuesday
  );

  final event233 = Slot(
      eventName: 'ES',
      startTime: '15:15',
      endTime: '16:15',
      recurrenceDays: [2], roomNumber: '201', enrolled: true, UG:2 // Occurs on Tuesday
  );

  final event234 = Slot(
      eventName: 'OOP 4',
      startTime: '16:30',
      endTime: '17:30',
      recurrenceDays: [2], roomNumber: '201', enrolled: true, UG:2 // Occurs on Tuesday
  );



  final event2361 = Slot(
      eventName: 'OOP 4',
      startTime: '8:45',
      endTime: '12:00',
      recurrenceDays: [3], roomNumber: 'C Lab', enrolled: true, UG:2 // Occurs on wednesday
  );


  final event2351 = Slot(
      eventName: 'OOP 1',
      startTime: '12:00',
      endTime: '13:00',
      recurrenceDays: [3], roomNumber: '103', enrolled: true, UG:2 // Occurs on wednesday, enrolled: null
  );


  final event237 = Slot(
      eventName: 'RANAC 1',
      startTime: '14:15',
      endTime: '15:15',
      recurrenceDays: [3], roomNumber: '101', enrolled: true, UG:2 // Occurs on wednesday
  );

  final event238 = Slot(
      eventName: 'RANAC 2',
      startTime: '14:15',
      endTime: '15:15',
      recurrenceDays: [3], roomNumber: '103', enrolled: true, UG:2 // Occurs on wednesday
  );

  final event239 = Slot(
      eventName: 'RANAC 3',
      startTime: '14:15',
      endTime: '15:15',
      recurrenceDays: [3], roomNumber: '105', enrolled: true, UG:2 // Occurs on wednesday
  );

  final event240 = Slot(
      eventName: 'CS',
      startTime: '14:15',
      endTime: '15:15',
      recurrenceDays: [3], roomNumber: '201', enrolled: true, UG:2 // Occurs on wednesday
  );


  final event241 = Slot(
      eventName: 'OOP 2',
      startTime: '15:15',
      endTime: '16:15',
      recurrenceDays: [3], roomNumber: '101', enrolled: true, UG:2 // Occurs on wednesday
  );

  final event242 = Slot(
      eventName: 'OOP 4',
      startTime: '15:15',
      endTime: '16:15',
      recurrenceDays: [3], roomNumber: '201', enrolled: true, UG:2 // Occurs on wednesday
  );


  final event243 = Slot(
      eventName: 'OOP 3',
      startTime: '15:15',
      endTime: '16:15',
      recurrenceDays: [3], roomNumber: '105', enrolled: true, UG:2 // Occurs on wednesday
  );


  final event244 = Slot(
      eventName: 'OOP 1',
      startTime: '16:30',
      endTime: '17:30',
      recurrenceDays: [3], roomNumber: '101', enrolled: true, UG:2 // Occurs on wednesday
  );


  final event245 = Slot(
      eventName: 'OS 2',
      startTime: '16:30',
      endTime: '17:30',
      recurrenceDays: [3], roomNumber: '103', enrolled: true, UG:2 // Occurs on wednesday
  );

  final event246 = Slot(
      eventName: 'OS 3',
      startTime: '16:30',
      endTime: '17:30',
      recurrenceDays: [3], roomNumber: '105', enrolled: true, UG:2 // Occurs on wednesday
  );

  final event247 = Slot(
      eventName: 'RANAC 4',
      startTime: '16:30',
      endTime: '17:30',
      recurrenceDays: [3], roomNumber: '201', enrolled: true, UG:2 // Occurs on wednesday
  );

  //Thursday UG2


  final event248 = Slot(
      eventName: 'OOP 1',
      startTime: '8:45',
      endTime: '12:00',
      recurrenceDays: [4], roomNumber: '113', enrolled: true, UG:2 // Occurs on Thursday
  );

  final event249 = Slot(
      eventName: 'OOP 2',
      startTime: '8:45',
      endTime: '12:00',
      recurrenceDays: [4], roomNumber: '115', enrolled: true, UG:2 // Occurs on Thursday
  );


  final event250 = Slot(
      eventName: 'OOP 3',
      startTime: '8:45',
      endTime: '12:00',
      recurrenceDays: [4], roomNumber: 'C Lab', enrolled: true, UG:2 // Occurs on Thursday
  );


  final event251 = Slot(
      eventName: 'RANAC 4',
      startTime: '8:45',
      endTime: '9:45',
      recurrenceDays: [4], roomNumber: '201', enrolled: true, UG:2 // Occurs on Thursday
  );

  final event252 = Slot(
      eventName: 'ES',
      startTime: '9:45',
      endTime: '10:45',
      recurrenceDays: [4], roomNumber: '201', enrolled: true, UG:2 // Occurs on Thursday
  );

  final event253 = Slot(
      eventName: 'CNA',
      startTime: '11:00',
      endTime: '12:00',
      recurrenceDays: [4], roomNumber: '107', enrolled: true, UG:2 // Occurs on Thursday
  );


  final event254 = Slot(
      eventName: 'RANAC 1',
      startTime: '12:00',
      endTime: '13:00',
      recurrenceDays: [4], roomNumber: '101', enrolled: true, UG:2 // Occurs on Thursday
  );

  final event255 = Slot(
      eventName: 'RANAC 2',
      startTime: '12:00',
      endTime: '13:00',
      recurrenceDays: [4], roomNumber: '103', enrolled: true, UG:2 // Occurs on Thursday
  );

  final event256 = Slot(
      eventName: 'RANAC 3',
      startTime: '12:00',
      endTime: '13:00',
      recurrenceDays: [4], roomNumber: '105', enrolled: true, UG:2 // Occurs on Thursday
  );


  final event2551 = Slot(
      eventName: 'OOP 4',
      startTime: '12:00',
      endTime: '13:00',
      recurrenceDays: [4], roomNumber: '201', enrolled: true, UG:2 // Occurs on Thursday
  );


  final event2561 = Slot(
      eventName: 'OOP 2',
      startTime: '14:15',
      endTime: '15:15',
      recurrenceDays: [4], roomNumber: '101', enrolled: true, UG:2 // Occurs on Thursday
  );


  final event257 = Slot(
      eventName: 'OOP 3',
      startTime: '14:15',
      endTime: '15:15',
      recurrenceDays: [4], roomNumber: '103', enrolled: true, UG:1 // Occurs on Thursday
  );

  final event258 = Slot(
      eventName: 'ADSA 1',
      startTime: '14:15',
      endTime: '15:15',
      recurrenceDays: [4], roomNumber: '107', enrolled: true, UG:2 // Occurs on Thursday
  );


  final event259 = Slot(
      eventName: 'CS',
      startTime: '14:15',
      endTime: '15:15',
      recurrenceDays: [4], roomNumber: '201', enrolled: true, UG:2 // Occurs on Thursday
  );


  final event260 = Slot(
      eventName: 'OOP 1',
      startTime: '15:15',
      endTime: '16:15',
      recurrenceDays: [4], roomNumber: '101', enrolled: true, UG:2 // Occurs on Thursday
  );


  final event261 = Slot(
      eventName: 'OS 2',
      startTime: '15:15',
      endTime: '16:15',
      recurrenceDays: [4], roomNumber: '103', enrolled: true, UG:2 // Occurs on Thursday
  );


  final event262 = Slot(
      eventName: 'OS 3',
      startTime: '15:15',
      endTime: '16:15',
      recurrenceDays: [4], roomNumber: '105', enrolled: true, UG:2 // Occurs on Thursday
  );

  final event263 = Slot(
      eventName: 'ADSA 2',
      startTime: '16:30',
      endTime: '17:30',
      recurrenceDays: [4], roomNumber: '101', enrolled: true, UG:2 // Occurs on Thursday
  );


  final event264 = Slot(
      eventName: 'ADSA 3',
      startTime: '16:30',
      endTime: '17:30',
      recurrenceDays: [4], roomNumber: '115', enrolled: true, UG:2 // Occurs on Thursday
  );

  // Friday UG-2

  final event265 = Slot(
      eventName: 'OS 1',
      startTime: '08:45',
      endTime: '09:45',
      recurrenceDays: [5], roomNumber: '101', enrolled: true, UG:2 // Occurs on Friday
  );

  final event266 = Slot(
      eventName: 'RANAC 2',
      startTime: '08:45',
      endTime: '09:45',
      recurrenceDays: [5], roomNumber: '103', enrolled: true, UG:2 // Occurs on Friday
  );


  final event267 = Slot(
      eventName: 'RANAC 3',
      startTime: '08:45',
      endTime: '09:45',
      recurrenceDays: [5], roomNumber: '105', enrolled: true, UG:2 // Occurs on Friday
  );

  final event268 = Slot(
      eventName: 'RANAC 1',
      startTime: '09:45',
      endTime: '10:45',
      recurrenceDays: [5], roomNumber: '101', enrolled: true, UG:2 // Occurs on Friday
  );



  final event269 = Slot(
      eventName: 'OS 2',
      startTime: '09:45',
      endTime: '10:45',
      recurrenceDays: [5], roomNumber: '103', enrolled: true, UG:2 // Occurs on Friday
  );

  final event270 = Slot(
      eventName: 'OS 3',
      startTime: '09:45',
      endTime: '10:45',
      recurrenceDays: [5], roomNumber: '105', enrolled: true, UG:2 // Occurs on Friday
  );

  final event271 = Slot(
      eventName: 'CNA',
      startTime: '09:45',
      endTime: '10:45',
      recurrenceDays: [5], roomNumber: '201', enrolled: true, UG:2 // Occurs on Friday
  );


  final event272 = Slot(
      eventName: 'DBMS 1',
      startTime: '11:00',
      endTime: '12:00',
      recurrenceDays: [5], roomNumber: '103', enrolled: true, UG:2 // Occurs on Friday
  );


  final event273 = Slot(
      eventName: 'DBMS 2',
      startTime: '11:00',
      endTime: '12:00',
      recurrenceDays: [5], roomNumber: '105', enrolled: true, UG:2 // Occurs on Friday
  );

  final event274 = Slot(
      eventName: 'DBMS 3',
      startTime: '11:00',
      endTime: '12:00',
      recurrenceDays: [5], roomNumber: '107', enrolled: true, UG:2 // Occurs on Friday
  );


  final event275 = Slot(
      eventName: 'RANAC 4',
      startTime: '11:00',
      endTime: '12:00',
      recurrenceDays: [5], roomNumber: '201', enrolled: true, UG:2 // Occurs on Friday
  );


  final event276 = Slot(
      eventName: 'ADSA 2',
      startTime: '12:00',
      endTime: '13:00',
      recurrenceDays: [5], roomNumber: '105', enrolled: true, UG:2 // Occurs on Friday
  );

  final event277 = Slot(
      eventName: 'ES',
      startTime: '12:00',
      endTime: '13:00',
      recurrenceDays: [5], roomNumber: '201', enrolled: true, UG:2 // Occurs on Friday
  );


  final event278 = Slot(
      eventName: 'DBMS 1',
      startTime: '14:15',
      endTime: '17:30',
      recurrenceDays: [5], roomNumber: '113', enrolled: true, UG:2 // Occurs on Friday
  );

  final event279 = Slot(
      eventName: 'DBMS 2',
      startTime: '14:15',
      endTime: '17:30',
      recurrenceDays: [5], roomNumber: '115', enrolled: true, UG:2 // Occurs on Friday
  );


  final event280 = Slot(
      eventName: 'DBMS 3',
      startTime: '14:15',
      endTime: '17:30',
      recurrenceDays: [5], roomNumber: 'C lab', enrolled: true, UG:2 // Occurs on Friday
  );






  //UG 1 MONDAY

  final event300 = Slot(
      eventName: 'CP 1',
      startTime: '08:45',
      endTime: '09:45',
      recurrenceDays: [1], roomNumber: '101', enrolled: true, UG:2 // Occurs on Monday
  );


  final event301 = Slot(
      eventName: 'CP 4',
      startTime: '08:45',
      endTime: '09:45',
      recurrenceDays: [1], roomNumber: '115', enrolled: true, UG:2 // Occurs on Monday
  );


  final event302 = Slot(
      eventName: 'DSMA 2',
      startTime: '08:45',
      endTime: '09:45',
      recurrenceDays: [1], roomNumber: '105', enrolled: true, UG:2 // Occurs on Monday
  );


  final event303 = Slot(
      eventName: 'DSMA 5',
      startTime: '08:45',
      endTime: '09:45',
      recurrenceDays: [1], roomNumber: '113', enrolled: true, UG:2 // Occurs on Monday
  );

  final event304 = Slot(
      eventName: 'OCW 1',
      startTime: '09:45',
      endTime: '10:45',
      recurrenceDays: [1], roomNumber: '101', enrolled: true, UG:2 // Occurs on Monday
  );

  final event305 = Slot(
      eventName: 'OCW 2',
      startTime: '09:45',
      endTime: '10:45',
      recurrenceDays: [1], roomNumber: '105', enrolled: true, UG:2 // Occurs on Monday
  );


  final event306 = Slot(
      eventName: 'DSMA 4',
      startTime: '09:45',
      endTime: '10:45',
      recurrenceDays: [1], roomNumber: '113', enrolled: true, UG:2 // Occurs on Monday
  );


  final event307 = Slot(
      eventName: 'CP 3',
      startTime: '09:45',
      endTime: '10:45',
      recurrenceDays: [1], roomNumber: '115', enrolled: true, UG:2 // Occurs on Monday
  );


  final event308 = Slot(
      eventName: 'CP 5',
      startTime: '09:45',
      endTime: '10:45',
      recurrenceDays: [1], roomNumber: 'C Lab', enrolled: true, UG:2 // Occurs on Monday
  );


  final event309 = Slot(
      eventName: 'DLD 1',
      startTime: '11:00',
      endTime: '12:00',
      recurrenceDays: [1], roomNumber: 'C Lab', enrolled: true, UG:2 // Occurs on Monday
  );


  final event310 = Slot(
      eventName: 'OCW 4',
      startTime: '11:00',
      endTime: '12:00',
      recurrenceDays: [1], roomNumber: '107', enrolled: true, UG:2 // Occurs on Monday
  );

  final event311 = Slot(
      eventName: 'DLD 3',
      startTime: '11:00',
      endTime: '12:00',
      recurrenceDays: [1], roomNumber: '113', enrolled: true, UG:2 // Occurs on Monday
  );


  final event312 = Slot(
      eventName: 'CP 2',
      startTime: '11:00',
      endTime: '12:00',
      recurrenceDays: [1], roomNumber: '115', enrolled: true, UG:2 // Occurs on Monday
  );


  final event313 = Slot(
      eventName: 'DSMA 1',
      startTime: '12:00',
      endTime: '13:00',
      recurrenceDays: [1], roomNumber: '101', enrolled: true, UG:2 // Occurs on Monday
  );


  final event314 = Slot(
      eventName: 'DSMA 3',
      startTime: '12:00',
      endTime: '13:00',
      recurrenceDays: [1], roomNumber: '105', enrolled: true, UG:2 // Occurs on Monday
  );


  final event315 = Slot(
      eventName: 'DLD 2',
      startTime: '12:00',
      endTime: '13:00',
      recurrenceDays: [1], roomNumber: '107', enrolled: true, UG:2 // Occurs on Monday
  );

  final event316 = Slot(
      eventName: 'DLD 5',
      startTime: '12:00',
      endTime: '13:00',
      recurrenceDays: [1], roomNumber: 'C Lab', enrolled: true, UG:2 // Occurs on Monday
  );


  final event317 = Slot(
      eventName: 'CP 1',
      startTime: '14:15',
      endTime: '17:30',
      recurrenceDays: [1], roomNumber: '113', enrolled: true, UG:2 // Occurs on Monday
  );


  final event318 = Slot(
      eventName: 'CP 2',
      startTime: '14:15',
      endTime: '17:30',
      recurrenceDays: [1], roomNumber: '115', enrolled: true, UG:2 // Occurs on Monday
  );

  final event319 = Slot(
      eventName: 'CP 5',
      startTime: '14:15',
      endTime: '17:30',
      recurrenceDays: [1], roomNumber: 'C Lab', enrolled: true, UG:2 // Occurs on Monday
  );


  final event320 = Slot(
      eventName: 'CP 4',
      startTime: '14:15',
      endTime: '17:30',
      recurrenceDays: [1], roomNumber: 'EC Lab-1 and 215', enrolled: true, UG:2 // Occurs on Monday
  );

  final event321 = Slot(
      eventName: 'CP 3',
      startTime: '14:15',
      endTime: '17:30',
      recurrenceDays: [1], roomNumber: '211 and 213', enrolled: true, UG:2 // Occurs on Monday
  );



  // UG 1 Classes Tuesday


  final event400 = Slot(
      eventName: 'OCW 3',
      startTime: '8:45',
      endTime: '9:45',
      recurrenceDays: [2], roomNumber: '107', enrolled: true, UG:1
  );


  final event401 = Slot(
      eventName: 'CP 1',
      startTime: '9:45',
      endTime: '10:45',
      recurrenceDays: [2], roomNumber: '101', enrolled: true, UG:1
  );

  final event402 = Slot(
      eventName: 'CP 2',
      startTime: '9:45',
      endTime: '10:45',
      recurrenceDays: [2], roomNumber: '103', enrolled: true, UG:1
  );

  final event403 = Slot(
      eventName: 'CP 3',
      startTime: '9:45',
      endTime: '10:45',
      recurrenceDays: [2], roomNumber: '105', enrolled: true, UG:1
  );


  final event404 = Slot(
      eventName: 'CP 4',
      startTime: '9:45',
      endTime: '10:45',
      recurrenceDays: [2], roomNumber: '107', enrolled: true, UG:1
  );

  final event405 = Slot(
      eventName: 'CP 5',
      startTime: '9:45',
      endTime: '10:45',
      recurrenceDays: [2], roomNumber: '113', enrolled: true, UG:1
  );

  final event406 = Slot(
      eventName: 'DSMA 1',
      startTime: '11:00',
      endTime: '12:00',
      recurrenceDays: [2], roomNumber: '101', enrolled: true, UG:1
  );

  final event407 = Slot(
      eventName: 'DSMA 3',
      startTime: '11:00',
      endTime: '12:00',
      recurrenceDays: [2], roomNumber: '105', enrolled: true, UG:1
  );

  final event408 = Slot(
      eventName: 'DSMA 4',
      startTime: '11:00',
      endTime: '12:00',
      recurrenceDays: [2], roomNumber: '107', enrolled: true, UG:1
  );


  final event409 = Slot(
      eventName: 'DLD 2',
      startTime: '12:00',
      endTime: '13:00',
      recurrenceDays: [2], roomNumber: '103', enrolled: true, UG:1
  );

  final event410 = Slot(
      eventName: 'DLD 3',
      startTime: '12:00',
      endTime: '13:00',
      recurrenceDays: [2], roomNumber: '105', enrolled: true, UG:1
  );

  final event411 = Slot(
      eventName: 'DLD 4',
      startTime: '12:00',
      endTime: '13:00',
      recurrenceDays: [2], roomNumber: '107', enrolled: true, UG:1
  );

  final event412 = Slot(
      eventName: 'DLD 5',
      startTime: '12:00',
      endTime: '13:00',
      recurrenceDays: [2], roomNumber: '113', enrolled: true, UG:1
  );

  final event413 = Slot(
      eventName: 'OCW 2',
      startTime: '14:15',
      endTime: '15:15',
      recurrenceDays: [2], roomNumber: '101', enrolled: true, UG:1
  );


  final event414 = Slot(
      eventName: 'DLD 3',
      startTime: '14:15',
      endTime: '17:30',
      recurrenceDays: [2], roomNumber: 'EC Lab 1,2', enrolled: true, UG:1
  );

  final event415 = Slot(
      eventName: 'DSMA 5',
      startTime: '14:15',
      endTime: '15:15',
      recurrenceDays: [2], roomNumber: '103', enrolled: true, UG:1
  );

  final event416 = Slot(
      eventName: 'DLD 1',
      startTime: '14:15',
      endTime: '15:15',
      recurrenceDays: [2], roomNumber: '107', enrolled: true, UG:1
  );

  final event417 = Slot(
      eventName: 'DSMA 2',
      startTime: '15:15',
      endTime: '16:15',
      recurrenceDays: [2], roomNumber: '101', enrolled: true, UG:1
  );

  // wednesday UG2


  final event500 = Slot(
      eventName: 'DLD 1',
      startTime: '08:45',
      endTime: '09:45',
      recurrenceDays: [3], roomNumber: '101', enrolled: true, UG:1 // Occurs on Wesnesday
  );


  final event501 = Slot(
      eventName: 'DLD 3',
      startTime: '08:45',
      endTime: '09:45',
      recurrenceDays: [3], roomNumber: '105', enrolled: true, UG:1 // Occurs on Wesnesday
  );


  final event502 = Slot(
      eventName: 'DLD 4',
      startTime: '08:45',
      endTime: '09:45',
      recurrenceDays: [3], roomNumber: '107', enrolled: true, UG:1 // Occurs on Wesnesday
  );

  final event503 = Slot(
      eventName: 'DLD 2',
      startTime: '08:45',
      endTime: '12:00',
      recurrenceDays: [3], roomNumber: 'EC Lab 1,2', enrolled: true, UG:1 // Occurs on Wesnesday
  );


  final event504 = Slot(
      eventName: 'DSMA 5',
      startTime: '08:45',
      endTime: '09:45',
      recurrenceDays: [3], roomNumber: '113', enrolled: true, UG:1 // Occurs on Wesnesday
  );


  final event505 = Slot(
      eventName: 'OCW 1',
      startTime: '09:45',
      endTime: '10:45',
      recurrenceDays: [3], roomNumber: '101', enrolled: true, UG:1 // Occurs on Wesnesday
  );


  final event506 = Slot(
      eventName: 'CP 4',
      startTime: '09:45',
      endTime: '10:45',
      recurrenceDays: [3], roomNumber: '103', enrolled: true, UG:1 // Occurs on Wesnesday
  );


  final event507 = Slot(
      eventName: 'OCW 5',
      startTime: '09:45',
      endTime: '10:45',
      recurrenceDays: [3], roomNumber: '105', enrolled: true, UG:1 // Occurs on Wesnesday
  );

  final event508 = Slot(
      eventName: 'DSMA 1',
      startTime: '11:00',
      endTime: '12:00',
      recurrenceDays: [3], roomNumber: '101', enrolled: true, UG:1 // Occurs on Wesnesday
  );


  final event509 = Slot(
      eventName: 'OCW 4',
      startTime: '11:00',
      endTime: '12:00',
      recurrenceDays: [3], roomNumber: '103', enrolled: true, UG:1 // Occurs on Wesnesday
  );

  final event510 = Slot(
      eventName: 'CP 3',
      startTime: '11:00',
      endTime: '12:00',
      recurrenceDays: [3], roomNumber: '105', enrolled: true, UG:1 // Occurs on Wesnesday
  );

  final event511 = Slot(
      eventName: 'DLD 5',
      startTime: '11:00',
      endTime: '12:00',
      recurrenceDays: [3], roomNumber: '113', enrolled: true, UG:1 // Occurs on Wesnesday
  );


  final event512 = Slot(
      eventName: 'CP 1',
      startTime: '12:00',
      endTime: '13:00',
      recurrenceDays: [3], roomNumber: '101', enrolled: true, UG:1 // Occurs on Wesnesday
  );

  final event513 = Slot(
      eventName: 'DSMA 3',
      startTime: '12:00',
      endTime: '13:00',
      recurrenceDays: [3], roomNumber: '105', enrolled: true, UG:1 // Occurs on Wesnesday
  );

  final event514 = Slot(
      eventName: 'DSMA 4',
      startTime: '12:00',
      endTime: '13:00',
      recurrenceDays: [3], roomNumber: '107', enrolled: true, UG:1 // Occurs on Wesnesday
  );


  final event515 = Slot(
      eventName: 'CP 5',
      startTime: '12:00',
      endTime: '13:00',
      recurrenceDays: [3], roomNumber: '113', enrolled: true, UG:1 // Occurs on Wesnesday
  );

  final event516 = Slot(
      eventName: 'OCW 2',
      startTime: '14:15',
      endTime: '17:30',
      recurrenceDays: [3], roomNumber: '113', enrolled: true, UG:1 // Occurs on Wesnesday
  );


  final event517 = Slot(
      eventName: 'OCW 5',
      startTime: '14:15',
      endTime: '17:30',
      recurrenceDays: [3], roomNumber: '115', enrolled: true, UG:1 // Occurs on Wesnesday
  );


  final event518 = Slot(
      eventName: 'OCW 1',
      startTime: '14:15',
      endTime: '17:30',
      recurrenceDays: [3], roomNumber: 'C Lab', enrolled: true, UG:1 // Occurs on Wesnesday
  );

  final event519 = Slot(
      eventName: 'OCW 3',
      startTime: '14:15',
      endTime: '17:30',
      recurrenceDays: [3], roomNumber: 'EC Lab-1,2', enrolled: true, UG:1 // Occurs on Wesnesday
  );

  final event520 = Slot(
      eventName: 'OCW 4',
      startTime: '14:15',
      endTime: '17:30',
      recurrenceDays: [3], roomNumber: '213 and 215', enrolled: true, UG:1 // Occurs on Wesnesday
  );

  // UG 1 Classes Thursday


  final event600 = Slot(
      eventName: 'DLD 4',
      startTime: '8:45',
      endTime: '9:45',
      recurrenceDays: [4], roomNumber: '101', enrolled: true, UG:1
  );

  final event601 = Slot(
      eventName: 'CP 2',
      startTime: '8:45',
      endTime: '9:45',
      recurrenceDays: [4], roomNumber: '105', enrolled: true, UG:1
  );

  final event602 = Slot(
      eventName: 'DSMA 1',
      startTime: '9:45',
      endTime: '10:45',
      recurrenceDays: [4], roomNumber: '101', enrolled: true, UG:1
  );


  final event603 = Slot(
      eventName: 'OCW 5',
      startTime: '9:45',
      endTime: '10:45',
      recurrenceDays: [4], roomNumber: '103', enrolled: true, UG:1
  );

  final event604 = Slot(
      eventName: 'OCW 4',
      startTime: '9:45',
      endTime: '10:45',
      recurrenceDays: [4], roomNumber: '105', enrolled: true, UG:1
  );

  final event605 = Slot(
      eventName: 'OCW 3',
      startTime: '11:00',
      endTime: '12:00',
      recurrenceDays: [4], roomNumber: '103', enrolled: true, UG:1
  );


  final event606 = Slot(
      eventName: 'OCW 2',
      startTime: '14:15',
      endTime: '15:15',
      recurrenceDays: [4], roomNumber: '105', enrolled: true, UG:1
  );


  final event607 = Slot(
      eventName: 'DLD 4',
      startTime: '14:15',
      endTime: '17:30',
      recurrenceDays: [4], roomNumber: 'EC Lab 1,2', enrolled: true, UG:1
  );

  final event608 = Slot(
      eventName: 'DLD 2',
      startTime: '15:15',
      endTime: '16:15',
      recurrenceDays: [4], roomNumber: '107', enrolled: true, UG:1
  );

  final event609 = Slot(
      eventName: 'DSMA 2',
      startTime: '16:30',
      endTime: '17:30',
      recurrenceDays: [4], roomNumber: '103', enrolled: true, UG:1
  );

  final event610 = Slot(
      eventName: 'OCW 1',
      startTime: '16:30',
      endTime: '17:30',
      recurrenceDays: [4], roomNumber: '113', enrolled: true, UG:1
  );


  // UG 1 Classes Fridaye

  final event700 = Slot(
      eventName: 'DLD 5',
      startTime: '8:45',
      endTime: '12:00',
      recurrenceDays: [5], roomNumber: 'EC Lab 1,2', enrolled: true, UG:1
  );


  final event701 = Slot(
      eventName: 'OCW 3',
      startTime: '9:45',
      endTime: '10:45',
      recurrenceDays: [5], roomNumber: '107', enrolled: true, UG:1
  );


  final event702 = Slot(
      eventName: 'DSMA 3',
      startTime: '14:15',
      endTime: '15:15',
      recurrenceDays: [5], roomNumber: '107', enrolled: true, UG:1
  );



  final event703 = Slot(
      eventName: 'DSMA 4',
      startTime: '15:15',
      endTime: '16:15',
      recurrenceDays: [5], roomNumber: '107', enrolled: true, UG:1
  );

  final event704 = Slot(
      eventName: 'DSMA 5',
      startTime: '15:15',
      endTime: '16:15',
      recurrenceDays: [5], roomNumber: '105', enrolled: true, UG:1
  );

  final event705 = Slot(
      eventName: 'DLD 1',
      startTime: '14:15',
      endTime: '17:30',
      recurrenceDays: [5], roomNumber: 'EC Lab 1,2', enrolled: true, UG:1
  );


  final event706 = Slot(
      eventName: 'DSMA 2',
      startTime: '16:30',
      endTime: '17:30',
      recurrenceDays: [5], roomNumber: '103', enrolled: true, UG:1
  );

  final event707 = Slot(
      eventName: 'OCW 5',
      startTime: '16:30',
      endTime: '17:30',
      recurrenceDays: [5], roomNumber: '107', enrolled: true, UG:1
  );


  @override
  Widget build(BuildContext context) {

    final List<Slot>events = [
      event1,
      event2,
      event3,
      event4,
      event5,
      event6,
      event7,
      event8,
      event9,
      event10,
      event11,
      event12,
      event13,
      event15,
      event14,
      event18, event19, event20, event21,event37,event38, event22, event24, event25, event26, event28, event29, event30, event31, event32, event33, event34, event35, event36,
      event56, event39, event40, event41, event42, event43, event44, event45, event46, event47, event48, event49, event50, event51, event52, event53, event54, event55,
      event57, event59, event60, event61, event62, event63, event64, event65, event66, event67,event68,event83,event841,event84, event69, event70, event71,
      event73, event74, event75, event76, event761,event77, event78, event79, event80,event81,event82,
      event100,event102,event103,event104,event105,event106,
      event107, event108, event109, event110, event111, event112, event113, event114, event115, event116, event117,
      event118, eventUnique,event119, event120, event121, event122, event123, event124,event125,event126,
      event127,event128,event129,event130,event131,event132, event133, event134, event135,event136,event137,
      event201,
      event202,
      event203,
      event204,
      event206,
      event207,
      event208,
      event209,
      event210,
      event211,
      event212,
      event213,
      event214,
      event215,
      event216,
      event217,
      event218,
      event219,
      event220,
      event221,
      event222,
      event223,
      event225,
      event226,
      event227,
      event228,
      event229,
      event230,
      event231,
      event232,
      event233,
      event234,
      event2351,event2361,event237,event238,event239,event240,event241,event242,event243,event244,event245,event246,event247,
      event248, event249, event250,
      event251, event252, event253, event254, event255, event256, event2551,event2561,event257,event258, event259, event260,
      event261, event262, event263, event264,
      event265, event266, event267, event268, event269, event270,
      event271, event272, event273, event274, event275, event276, event277, event278, event279, event280,
      event300, event301, event302, event303, event304, event305, event306, event307, event308, event309, event310, event311, event312, event313, event314, event315, event316, event317, event318, event319, event320, event321,
      event400, event401, event402, event403, event404, event405, event406, event407, event408, event409, event410, event411, event412, event413, event414, event415, event416, event417,
      event500, event501, event502, event503, event504, event505, event506, event507, event508, event509, event510, event511, event512, event513, event514, event515, event516, event517, event518, event519, event520,
      event600, event601, event602, event603, event604, event605, event606, event607, event608, event609, event610,
      event700,event701,event702,event703,event704,event705,event706,event707,
      s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15,

    ];
    DateTime now = DateTime.now();
    int dayOfWeekAsNumber = getDayOfWeekAsNumber(now);

    return MaterialApp(
      title: 'Next Class',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      //home : UGPage(events: events,),
     home: FirebaseAuth.instance.currentUser == null ? LoginScreen(events: events) : BottomBarScreen(events: events)
    );
  }
}
