import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:next_class/screens/bottombar.dart';
import 'package:next_class/screens/signup_screen.dart';
import 'package:next_class/screens/ug_page.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import '../data/slot.dart';
import '../widgets/roundedButton.dart';
import 'branch_page.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({required this.events});
  final List<Slot> events;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final fi = FirebaseFirestore.instance;
  late String email;
  late String password;

  int getDayOfWeekAsNumber(DateTime date) {
    // DateTime's weekday starts from 1 (Monday) to 7 (Sunday)
    // We need to convert it to our desired format, where Monday is 1, Tuesday is 2, and so on.
    return date.weekday % 7 ;
  }

  List<String> cse = ['FDFED 1','FDFED 2','FDFED 3','IDA','CC','BTA','CD','GTA','NLP','ML 1','ML 2','ICS 1','ICS 2','MIA','IR','DM','CGM'];
  List<String> ece =['VLSI','DSP','PR','WC','MPMC','EP','ICPS'];






  Future<void> signInWithGoogle() async {
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


        final currentUser = FirebaseAuth.instance.currentUser;
        final userRef = FirebaseFirestore.instance.collection('users').doc(currentUser?.uid);
        final userSnapshot = await userRef.get();

        DateTime now = DateTime.now();
        int dayOfWeekAsNumber = getDayOfWeekAsNumber(now);
        print("Day of Week as Number : ${dayOfWeekAsNumber}");

        if (userSnapshot.exists) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomBarScreen(events: widget.events,selectedIndex: 0,)));
        } else {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UGPage(events: widget.events,)));
        }

        await saveUser(account);

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
    late final UserCredential loggedInUser;


    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40,),
            Text("nextClass",style: GoogleFonts.josefinSans(fontSize: 50)),
            SizedBox(height: 2,),
            Image.asset('assets/nextClass.png',height: 250,width: 250,),
            SizedBox(height: 5,),
            SizedBox(
              height: 10.0,
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(32)),
              child: SocialLoginButton(
                  textColor: Colors.black,
                  buttonType: SocialLoginButtonType.google,
                  onPressed: () {
                    signInWithGoogle();
                    print("Google Sign In Clicked!");
                  }),
            ),
            SizedBox(height: 50,),
            TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                //Do something with the user input.\
                email = value;

              },
              style: TextStyle(color: Colors.black),
              decoration: kTextFieldDecoration.copyWith(
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: 'Enter your email'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              onChanged: (value) {
                //Do something with the user input.
                password = value;

              },
              style: TextStyle(color: Colors.black),
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(color: Colors.grey)),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> RegistrationScreen(events: widget.events)));
                  },
                  child: Text("New User?  Sign Up!"),
                ),
              ],
            ),
            SizedBox(
              height: 1.0,
            ),
            RoundedButton(
              mycolor: Colors.blueGrey.shade900,
              text: 'Log In',
              onPressedfunc: () async {
                try {
                  loggedInUser = await auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  // Retrieve the current user's UID
                  final currentUser = FirebaseAuth.instance.currentUser;
                  final userRef = FirebaseFirestore.instance.collection('users').doc(currentUser?.uid);
                  final userSnapshot = await userRef.get();

                  if (userSnapshot.exists) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomBarScreen(events: widget.events)));
                  } else {
                    // User does not exist in Firestore, handle accordingly
                    // For example, show an error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('User does not exist. Please sign up.'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomBarScreen(events: widget.events)));
                } catch (e) {
                  print(e);
                }
              }
            ),


          ],
        ),
      ),
    ));
  }
}