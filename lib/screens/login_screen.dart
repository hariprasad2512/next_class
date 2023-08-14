import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:next_class/data/timetable.dart';
import 'package:next_class/screens/bottombar.dart';
import 'package:next_class/screens/user_success.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import '../data/slot.dart';
import 'branch_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final fi = FirebaseFirestore.instance;

  int getDayOfWeekAsNumber(DateTime date) {
    // DateTime's weekday starts from 1 (Monday) to 7 (Sunday)
    // We need to convert it to our desired format, where Monday is 1, Tuesday is 2, and so on.
    return date.weekday % 7 ;
  }

  List<String> cse = ['FDFED 1','FDFED 2','FDFED 3','IDA','CC','BTA','CD','GTA','NLP','ML 1','ML 2','ICS 1','ICS 2','MIA','IR','DM','CGM'];
  List<String> ece =['VLSI','DSP','PR','WC','MPMC','EP','ICPS'];

  final event1 = Slot(
    eventName: 'ICS 1',
    startTime: '08:45',
    endTime: '09:45',
    recurrenceDays: [1], roomNumber: '201', enrolled: true, // Occurs on Monday
  );

  final event2 = Slot(
    eventName: 'ICS 2',
    startTime: '08:45',
    endTime: '09:45',
    recurrenceDays: [1], roomNumber: '203', enrolled: true, // Occurs on Monday
  );

  final event3 = Slot(
    eventName: 'BTA',
    startTime: '08:45',
    endTime: '09:45',
    recurrenceDays: [1], roomNumber: '205', enrolled: true, // Occurs on Monday
  );
  final event4 = Slot(
    eventName: 'CD',
    startTime: '08:45',
    endTime: '09:45',
    recurrenceDays: [1], roomNumber: '207', enrolled: true, // Occurs on Monday
  );
  final event5 = Slot(
    eventName: 'WC',
    startTime: '08:45',
    endTime: '09:45',
    recurrenceDays: [1], roomNumber: '201', enrolled: true, // Occurs on Monday
  );
  final event6 = Slot(
    eventName: 'IDA',
    startTime: '09:45',
    endTime: '10:45',
    recurrenceDays: [1], roomNumber: '101', enrolled: true, // Occurs on Monday
  );

  final event7 = Slot(
    eventName: 'DSP',
    startTime: '11:00',
    endTime: '12:00',
    recurrenceDays: [1], roomNumber: '105', enrolled: true, // Occurs on Monday
  );

  final event8 = Slot(
    eventName: 'CGM',
    startTime: '11:00',
    endTime: '12:00',
    recurrenceDays: [1], roomNumber: '207', enrolled: true, // Occurs on Monday
  );
  final event9 = Slot(
    eventName: 'CC 1',
    startTime: '12:00',
    endTime: '13:00',
    recurrenceDays: [1], roomNumber: '113', enrolled: true, // Occurs on Monday
  );
  final event10 = Slot(
    eventName: 'CC 2',
    startTime: '12:00',
    endTime: '13:00',
    recurrenceDays: [1], roomNumber: '115', enrolled: true, // Occurs on Monday
  );

  final event11 = Slot(
    eventName: 'GTA',
    startTime: '12:00',
    endTime: '13:00',
    recurrenceDays: [1], roomNumber: '201', enrolled: true, // Occurs on Monday
  );

  final event12 = Slot(
    eventName: 'MPMC',
    startTime: '12:00',
    endTime: '13:00',
    recurrenceDays: [1], roomNumber: '213', enrolled: true, // Occurs on Monday
  );

  final event13 = Slot(
    eventName: 'FDFED 1',
    startTime: '14:15',
    endTime: '15:15',
    recurrenceDays: [1], roomNumber: '107', enrolled: true, // Occurs on Monday
  );

  final event14 = Slot(
    eventName: 'MPMC',
    startTime: '14:15',
    endTime: '15:15',
    recurrenceDays: [1], roomNumber: 'EC Lab2',
    enrolled: true, // Occurs on Monday
  );

  final event15 = Slot(
    eventName: 'FDFED 2',
    startTime: '15:15',
    endTime: '16:15',
    recurrenceDays: [1], roomNumber: '107', enrolled: true, // Occurs on Monday
  );

  final event16 = Slot(
    eventName: 'MPMC',
    startTime: '15:15',
    endTime: '16:15',
    recurrenceDays: [1], roomNumber: 'EC Lab2',
    enrolled: true, // Occurs on Monday
  );

  final event17 = Slot(
    eventName: 'MPMC',
    startTime: '16:30',
    endTime: '17:30',
    recurrenceDays: [1], roomNumber: 'EC Lab2',
    enrolled: true, // Occurs on Monday
  );



  final event18 = Slot(
    eventName: 'FDFED 1',
    startTime: '08:45',
    endTime: '09:45',
    recurrenceDays: [2], roomNumber: '113', enrolled: true, // Occurs on tuesday
  );

  final event19 = Slot(
    eventName: 'FDFED 2',
    startTime: '08:45',
    endTime: '09:45',
    recurrenceDays: [2], roomNumber: '115', enrolled: true, // Occursontuesday
  );

  final event20 = Slot(
    eventName: 'FDFED 3',
    startTime: '08:45',
    endTime: '09:45',
    recurrenceDays: [2], roomNumber: 'C Lab', enrolled: true, // Occursontuesday
  );


  final event21 = Slot(
    eventName: 'ICS 1',
    startTime: '09:45',
    endTime: '10:45',
    recurrenceDays: [2], roomNumber: '201', enrolled: true, // Occursontuesday
  );

  final event37 = Slot(
    eventName: 'ICS 2',
    startTime: '09:45',
    endTime: '10:45',
    recurrenceDays: [2], roomNumber: '203', enrolled: true, // Occursontuesday
  );

  final event38 = Slot(
    eventName: 'BTA',
    startTime: '09:45',
    endTime: '10:45',
    recurrenceDays: [2], roomNumber: '215', enrolled: true, // Occursontuesday
  );



  final event22 = Slot(
    eventName: 'CD',
    startTime: '09:45',
    endTime: '10:45',
    recurrenceDays: [2], roomNumber: '211', enrolled: true, // Occursontuesday
  );

  final event23 = Slot(
    eventName: 'MPMC',
    startTime: '09:45',
    endTime: '10:45',
    recurrenceDays: [2], roomNumber: '213', enrolled: true, // Occursontuesday
  );


  final event24 = Slot(
    eventName: 'MIA',
    startTime: '11:00',
    endTime: '12:00',
    recurrenceDays: [2], roomNumber: '201', enrolled: true, // Occursontuesday
  );


  final event25 = Slot(
    eventName: 'DSP',
    startTime: '11:00',
    endTime: '12:00',
    recurrenceDays: [2], roomNumber: '103', enrolled: true, // Occursontuesday
  );


  final event26 = Slot(
    eventName: 'IDA',
    startTime: '12:00',
    endTime: '13:00',
    recurrenceDays: [2], roomNumber: 'C Lab', enrolled: true, // Occursontuesday
  );


  final event28 = Slot(
    eventName: 'VLSI',
    startTime: '14:15',
    endTime: '15:15',
    recurrenceDays: [2], roomNumber: '105', enrolled: true, // Occursontuesday
  );

  final event29 = Slot(
    eventName: 'NLP',
    startTime: '14:15',
    endTime: '15:15',
    recurrenceDays: [2], roomNumber: '211', enrolled: true, // Occursontuesday
  );


  final event30 = Slot(
    eventName: 'ML 1',
    startTime: '14:15',
    endTime: '15:15',
    recurrenceDays: [2], roomNumber: '213', enrolled: true, // Occursontuesday
  );

  final event31 = Slot(
    eventName: 'ML 2',
    startTime: '14:15',
    endTime: '15:15',
    recurrenceDays: [2], roomNumber: '215', enrolled: true, // Occursontuesday
  );



  final event32 = Slot(
    eventName: 'DM',
    startTime: '15:15',
    endTime: '16:15',
    recurrenceDays: [2], roomNumber: '103', enrolled: true, // Occursontuesday
  );


  final event33 = Slot(
    eventName: 'PR',
    startTime: '15:15',
    endTime: '16:15',
    recurrenceDays: [2], roomNumber: '213', enrolled: true, // Occursontuesday
  );


  final event34 = Slot(
    eventName: 'CGM',
    startTime: '15:15',
    endTime: '16:15',
    recurrenceDays: [2], roomNumber: '207', enrolled: true, // Occursontuesday
  );


  final event35 = Slot(
    eventName: 'IR',
    startTime: '15:15',
    endTime: '16:15',
    recurrenceDays: [2], roomNumber: '107', enrolled: true, // Occursontuesday
  );



  final event36 = Slot(
    eventName: 'ICPS',
    startTime: '16:30',
    endTime: '17:30',
    recurrenceDays: [2], roomNumber: '205', enrolled: true, // Occursontuesday
  );



  final event56 = Slot(
    eventName: 'ICS 1',
    startTime: '08:45',
    endTime: '09:45',
    recurrenceDays: [3],
    roomNumber: '201',
    enrolled: true, // Occurs on Wednesday
  );

  final event39 = Slot(
    eventName: 'ICS 2',
    startTime: '08:45',
    endTime: '09:45',
    recurrenceDays: [3],
    roomNumber: '203',
    enrolled: true, // Occurs on Wednesday
  );

  final event40 = Slot(
    eventName: 'BTA',
    startTime: '08:45',
    endTime: '09:45',
    recurrenceDays: [3],
    roomNumber: '205',
    enrolled: true, // Occurs on Wednesday
  );

  final event41 = Slot(
    eventName: 'CD',
    startTime: '08:45',
    endTime: '09:45',
    recurrenceDays: [3],
    roomNumber: '207',
    enrolled: true, // Occurs on Wednesday
  );

  final event42 = Slot(
    eventName: 'EP',
    startTime: '08:45',
    endTime: '09:45',
    recurrenceDays: [3],
    roomNumber: '211',
    enrolled: true, // Occurs on Wednesday
  );

  final event43 = Slot(
    eventName: 'IR',
    startTime: '09:45',
    endTime: '10:45',
    recurrenceDays: [3],
    roomNumber: '107',
    enrolled: true, // Occurs on Wednesday
  );

  final event44 = Slot(
    eventName: 'DM',
    startTime: '09:45',
    endTime: '10:45',
    recurrenceDays: [3],
    roomNumber: '113',
    enrolled: true, // Occurs on Wednesday
  );

  final event45 = Slot(
    eventName: 'PR',
    startTime: '09:45',
    endTime: '10:45',
    recurrenceDays: [3],
    roomNumber: '211',
    enrolled: true, // Occurs on Wednesday
  );

  final event46 = Slot(
    eventName: 'DSP',
    startTime: '11:00',
    endTime: '12:00',
    recurrenceDays: [3],
    roomNumber: '107',
    enrolled: true, // Occurs on Wednesday
  );

  final event47 = Slot(
    eventName: 'NLP',
    startTime: '11:00',
    endTime: '12:00',
    recurrenceDays: [3],
    roomNumber: '211',
    enrolled: true, // Occurs on Wednesday
  );

  final event48 = Slot(
    eventName: 'ML 1',
    startTime: '11:00',
    endTime: '12:00',
    recurrenceDays: [3],
    roomNumber: '213',
    enrolled: true, // Occurs on Wednesday
  );

  final event49 = Slot(
    eventName: 'ML 2',
    startTime: '11:00',
    endTime: '12:00',
    recurrenceDays: [3],
    roomNumber: '215',
    enrolled: true, // Occurs on Wednesday
  );

  final event50 = Slot(
    eventName: 'VLSI',
    startTime: '12:00',
    endTime: '13:00',
    recurrenceDays: [3],
    roomNumber: '115',
    enrolled: true, // Occurs on Wednesday
  );

  final event51 = Slot(
    eventName: 'MIA',
    startTime: '12:00',
    endTime: '13:00',
    recurrenceDays: [3],
    roomNumber: '215',
    enrolled: true, // Occurs on Wednesday
  );

  final event52 = Slot(
    eventName: 'CGM',
    startTime: '14:15',
    endTime: '15:15',
    recurrenceDays: [3],
    roomNumber: '211',
    enrolled: true, // Occurs on Wednesday
  );

  final event53 = Slot(
    eventName: 'FDFED 3',
    startTime: '15:15',
    endTime: '16:15',
    recurrenceDays: [3],
    roomNumber: '107',
    enrolled: true, // Occurs on Wednesday
  );

  final event54 = Slot(
    eventName: 'EP',
    startTime: '15:15',
    endTime: '16:15',
    recurrenceDays: [3],
    roomNumber: '211',
    enrolled: true, // Occurs on Wednesday
  );

  final event55 = Slot(
    eventName: 'ICPS',
    startTime: '16:30',
    endTime: '17:30',
    recurrenceDays: [3],
    roomNumber: '205',
    enrolled: true, // Occurs on Wednesday
  );


  final event57 = Slot(
    eventName: 'DM',
    startTime: '08:45',
    endTime: '09:45',
    recurrenceDays: [4],
    roomNumber: '103',
    enrolled: true, // Occurs on Thursday
  );


  final event58 = Slot(
    eventName: 'MPMC',
    startTime: '08:45',
    endTime: '09:45',
    recurrenceDays: [4],
    roomNumber: '215',
    enrolled: true, // Occurs on Thursday
  );


  final event59 = Slot(
    eventName: 'PR',
    startTime: '09:45',
    endTime: '10:45',
    recurrenceDays: [4],
    roomNumber: '211',
    enrolled: true, // Occurs on Thursday
  );

  final event60 = Slot(
    eventName: 'NLP',
    startTime: '09:45',
    endTime: '10:45',
    recurrenceDays: [4],
    roomNumber: '213',
    enrolled: true, // Occurs on Thursday
  );



  final event61 = Slot(
    eventName: 'MIA',
    startTime: '09:45',
    endTime: '10:45',
    recurrenceDays: [4],
    roomNumber: '215',
    enrolled: true, // Occurs on Thursday
  );


  final event62 = Slot(
    eventName: 'CC 1',
    startTime: '11:00',
    endTime: '12:00',
    recurrenceDays: [4],
    roomNumber: '101',
    enrolled: true, // Occurs on Thursday
  );


  final event63 = Slot(
    eventName: 'CC 2',
    startTime: '11:00',
    endTime: '12:00',
    recurrenceDays: [4],
    roomNumber: '105',
    enrolled: true, // Occurs on Thursday
  );

  final event64 = Slot(
    eventName: 'GTA',
    startTime: '11:00',
    endTime: '12:00',
    recurrenceDays: [4],
    roomNumber: '203',
    enrolled: true, // Occurs on Thursday
  );

  final event65 = Slot(
    eventName: 'EP',
    startTime: '11:00',
    endTime: '12:00',
    recurrenceDays: [4],
    roomNumber: '211',
    enrolled: true, // Occurs on Thursday
  );


  final event66 = Slot(
    eventName: 'FDFED 1',
    startTime: '12:00',
    endTime: '13:00',
    recurrenceDays: [4],
    roomNumber: '113',
    enrolled: true, // Occurs on Thursday
  );


  final event67 = Slot(
    eventName: 'FDFED 2',
    startTime: '12:00',
    endTime: '13:00',
    recurrenceDays: [4],
    roomNumber: '115',
    enrolled: true, // Occurs on Thursday
  );


  final event68 = Slot(
    eventName: 'FDFED 3',
    startTime: '12:00',
    endTime: '13:00',
    recurrenceDays: [4],
    roomNumber: 'C Lab',
    enrolled: true, // Occurs on Thursday
  );


  final event83 = Slot(
    eventName: 'WC',
    startTime: '12:00',
    endTime: '13:00',
    recurrenceDays: [4],
    roomNumber: '213',
    enrolled: true, // Occurs on Thursday
  );


  final event84 = Slot(
    eventName: 'ML 2',
    startTime: '14:15',
    endTime: '17:30',
    recurrenceDays: [4],
    roomNumber: 'C Lab',
    enrolled: true, // Occurs on Thursday
  );


  final event69 = Slot(
    eventName: 'VLSI',
    startTime: '14:15',
    endTime: '15:15',
    recurrenceDays: [4],
    roomNumber: '113',
    enrolled: true, // Occurs on Thursday
  );

  final event70 = Slot(
    eventName: 'DSP',
    startTime: '15:15',
    endTime: '16:15',
    recurrenceDays: [4],
    roomNumber: '113',
    enrolled: true, // Occurs on Thursday
  );


  final event71 = Slot(
    eventName: 'ICPS',
    startTime: '16:30',
    endTime: '17:30',
    recurrenceDays: [4],
    roomNumber: '205',
    enrolled: true, // Occurs on Thursday
  );

  final event72 = Slot(
    eventName: 'ML 1',
    startTime: '14:15',
    endTime: '17:30',
    recurrenceDays: [4],
    roomNumber: '215',
    enrolled: true, // Occurs on Thursday
  );


  final event73 = Slot(
    eventName: 'FDFED 1',
    startTime: '8:45',
    endTime: '12:00',
    recurrenceDays: [5],
    roomNumber: '113',
    enrolled: true, // Occurs on Friday
  );

  final event74 = Slot(
    eventName: 'FDFED 2',
    startTime: '8:45',
    endTime: '12:00',
    recurrenceDays: [5],
    roomNumber: '115',
    enrolled: true, // Occurs on Friday
  );

  final event75 = Slot(
    eventName: 'FDFED 3',
    startTime: '8:45',
    endTime: '12:00',
    recurrenceDays: [5],
    roomNumber: 'C Lab',
    enrolled: true, // Occurs on Friday
  );

  final event76 = Slot(
    eventName: 'CC 1',
    startTime: '12:00',
    endTime: '13:00',
    recurrenceDays: [5],
    roomNumber: '101',
    enrolled: true, // Occurs on Friday
  );

  final event77 = Slot(
    eventName: 'CC 2',
    startTime: '12:00',
    endTime: '13:00',
    recurrenceDays: [5],
    roomNumber: '103',
    enrolled: true, // Occurs on Friday
  );

  final event78 = Slot(
    eventName: 'GTA',
    startTime: '12:00',
    endTime: '13:00',
    recurrenceDays: [5],
    roomNumber: '203',
    enrolled: true, // Occurs on Friday
  );


  final event79 = Slot(
    eventName: 'WC',
    startTime: '14:15',
    endTime: '15:15',
    recurrenceDays: [5],
    roomNumber: '213',
    enrolled: true, // Occurs on Friday
  );

  final event80 = Slot(
    eventName: 'IR',
    startTime: '14:15',
    endTime: '15:15',
    recurrenceDays: [5],
    roomNumber: '103',
    enrolled: true, // Occurs on Friday
  );

  final event81 = Slot(
    eventName: 'IDA',
    startTime: '15:15',
    endTime: '16:15',
    recurrenceDays: [5],
    roomNumber: '101',
    enrolled: true, // Occurs on Friday
  );


  final event82 = Slot(
    eventName: 'VLSI',
    startTime: '16:30',
    endTime: '17:30',
    recurrenceDays: [5],
    roomNumber: '101',
    enrolled: true, // Occurs on Friday
  );




  Future<void> signInWithGoogle() async {

    final List<Slot> events = [
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
      event14,
      event15,
      event16,
      event17,
      event18, event19, event20, event21, event22, event23, event24, event25, event26, event28, event29, event30, event31, event32, event33, event34, event35, event36,
      event37,event38,
      event56, event39, event40, event41, event42, event43, event44, event45, event46, event47, event48, event49, event50, event51, event52, event53, event54, event55,
      event57, event58, event59, event60, event61, event62, event63, event64, event65, event66, event67, event68, event69, event70, event71, event72,
      event73, event74, event75, event76, event77, event78, event79, event80,event81,event82,event83,event84
    ];
    final GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    try {
      await googleSignIn.signOut();

      GoogleSignInAccount? account = await googleSignIn.signIn();
      if (account != null) {

        final _gAuth = await account.authentication;
        final _credential = GoogleAuthProvider.credential(
          idToken: _gAuth.idToken,
          accessToken: _gAuth.accessToken,
        );

        await auth.signInWithCredential(_credential);
        await saveUser(account);

        final currentUser = FirebaseAuth.instance.currentUser;
        final userRef = FirebaseFirestore.instance.collection('users').doc(currentUser?.uid);
        final userSnapshot = await userRef.get();

        DateTime now = DateTime.now();
        int dayOfWeekAsNumber = getDayOfWeekAsNumber(now);
        print("Day of Week as Number : ${dayOfWeekAsNumber}");

        if (userSnapshot.exists) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomBarScreen(events: events)));
        } else {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BranchSelection()));
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Signed In Successfully'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> saveUser(GoogleSignInAccount account) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final userRef =
    FirebaseFirestore.instance.collection('users').doc(currentUser?.uid);
    final userSnapshot = await userRef.get();

    if (!userSnapshot.exists) {
      // User does not exist in Firestore, create a new document
      await userRef.set({
        "email": account.email,
        "name": account.displayName,
        "profilePic": account.photoUrl,
      });
    }

    print("Saved User data");
  }








  static const kTextFieldDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
  );
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("nextClass",style: GoogleFonts.josefinSans(fontSize: 60)),
          SizedBox(height: 50,),
          Image.asset('assets/nextClass.png',height: 300,width: 300,),
          SizedBox(height: 80,),
          SocialLoginButton(
              textColor: Colors.black,
              buttonType: SocialLoginButtonType.google,
              onPressed: () {
                signInWithGoogle();
                print("Google Sign In Clicked!");
              })
        ],
      ),
    ));
  }
}