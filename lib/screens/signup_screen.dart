import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:next_class/screens/login_screen.dart';
import 'package:next_class/screens/ug_page.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

import '../data/slot.dart';
import '../widgets/roundedButton.dart';
import 'bottombar.dart';
import 'branch_page.dart';

class RegistrationScreen extends StatefulWidget {

  final List<Slot> events;
  RegistrationScreen({required this.events});
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}
//Steps to use Firebase for Registration and Authentication
// 1. Initialise Firebase in initState
// 2. Create an instance of FirebaseAuth to use Authentication package
// 3. Create variables for user entries like email and password
// 4. Use onChanged method in TextInput to store the value of the
//    input into the variable
// 5. In the onPressed function of the Register Button, create a new
//    UserCredential object using auth.createUserWithEmailAndPassword
//    Method. Use that to navigate to the ChatScreen.

class _RegistrationScreenState extends State<RegistrationScreen> {
  late FirebaseAuth auth = FirebaseAuth.instance;
  late String email;
  late String password;

  int getDayOfWeekAsNumber(DateTime date) {
    // DateTime's weekday starts from 1 (Monday) to 7 (Sunday)
    // We need to convert it to our desired format, where Monday is 1, Tuesday is 2, and so on.
    return date.weekday % 7 ;
  }

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
        await saveUser(account);

        final currentUser = FirebaseAuth.instance.currentUser;
        final userRef = FirebaseFirestore.instance.collection('users').doc(currentUser?.uid);
        final userSnapshot = await userRef.get();

        DateTime now = DateTime.now();
        int dayOfWeekAsNumber = getDayOfWeekAsNumber(now);
        print("Day of Week as Number : ${dayOfWeekAsNumber}");


          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UGPage(events: widget.events)));


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


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  static const kTextFieldDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    UserCredential? newUser;



    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 40,),
                  SizedBox(height: 2,),
                  Image.asset('assets/nextClass.png',height: 250,width: 250,),
                  Center(child: Text("Sign Up",style: GoogleFonts.josefinSans(fontSize: 35))),
                  SizedBox(height: 30,),
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
                  SizedBox(height: 30,),
                  TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      //Do something with the user input.\
                      email =value;

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
                  SizedBox(
                    height: 24.0,
                  ),
                  RoundedButton(
                      mycolor: Colors.blueGrey.shade900,
                      text: 'Sign Up',
                      onPressedfunc: () async{
                        try {
                          final newUser = await auth
                              .createUserWithEmailAndPassword(
                              email: email, password: password);
                          if (newUser.user != null) {
                            // Successfully created a new user
                            final userRef =
                            FirebaseFirestore.instance.collection('users').doc(
                                newUser.user!.uid);

                            // Check if the user exists in Firestore
                            final userSnapshot = await userRef.get();
                            if (!userSnapshot.exists) {
                              // User does not exist in Firestore, create a new document
                              await userRef.set({
                                "email": email,
                                // You can add more user-related data here as needed
                              });
                            }
                            Navigator.push((context), MaterialPageRoute(
                                builder: (context) =>
                                    UGPage(events: widget.events)));
                          }
                        }catch (e) {
    print(e);
    }
                      }
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen(events: widget.events)));
                        },
                        child: Text("Already have an account?"),
                      ),
                    ],
                  ),
                  SizedBox(height: 50,),

                ],
              ),
        ),
      ),
    );
  }
}
