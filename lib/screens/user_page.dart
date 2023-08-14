import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:next_class/screens/branch_page.dart';
import 'package:next_class/screens/login_screen.dart';
import 'package:next_class/screens/subjects_page.dart';

import 'bottombar.dart';


class UserPage extends StatefulWidget {
  UserPage({super.key,});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  int currentIndex = 0;
  late var accentColor = Color(0xffededed);

  List<String> badges = [
    'bronze',
    'silver',
    'gold',
    'sapphire',
    'ruby',
    'emerald',
    'amethyst',
    'pearl',
    'obsidian',
    'diamond'
  ];

  late var currentLength = 0;
  late var maxLength = 50;

  var brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;

  Future<int> getMoviePosterURLs(String uid) async {
    try {
      // Get user document by UID
      final userDoc =
      await FirebaseFirestore.instance.collection('users').doc(uid).get();

      if (!userDoc.exists) {
        throw Exception('User document does not exist');
      }

      // Get movie IDs array from user document
      final movieIds = List<num>.from(userDoc.data()!['watchedList']);

      // Array to store movie poster URLs
      return movieIds.length;
    } catch (error) {
      print('Error retrieving movie poster URLs: $error');
      rethrow;
    }
  }

  String badge = 'bronze';




  @override
  void initState() {
    // TODO: implement initState

  }

  @override
  Widget build(BuildContext context) {
    final currentUser = auth.currentUser;
    final fullName = currentUser?.displayName;
    var nameList = fullName?.split(' ');
    var firstName = nameList?[0];
    bool isDark = brightness == Brightness.dark;
    Future<void> showLogOutDialog() async {
      await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: isDark ? Colors.black : Colors.white,
              title: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.arrowRightFromBracket,
                    size: 20,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Sign Out',
                    style:
                    TextStyle(color: isDark ? Colors.white : Colors.black),
                  ),
                ],
              ),
              content: Text(
                'Are you sure you want to sign out?',
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 15,
                      ),
                    )),
                TextButton(
                    onPressed: () async {
                      try {
                        await auth.signOut();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                            ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Signed Out Successfully'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text(
                      'Sign Out',
                      style: TextStyle(color: Colors.redAccent, fontSize: 15),
                    ))
              ],
            );
          });
    }

    return Scaffold(
        backgroundColor: isDark ? Colors.black : Colors.white,
        body: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 10),
                              SizedBox(
                                child: RichText(
                                    text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: '${firstName ?? "Guest"}!',
                                              style: GoogleFonts.playfairDisplay(
                                                  color: isDark
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: 35)),
                                        ],
                                        text: ' Hey there ',
                                        style: GoogleFonts.playfairDisplay(
                                            color: isDark
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 35))),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Divider(
                            thickness: 2,
                            color: isDark ? Colors.white : Colors.black54,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          listItem(
                            title: 'Edit Courses',
                            myicon: FaIcon(
                              FontAwesomeIcons.graduationCap,
                              color: isDark ? Colors.white : Colors.black,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BranchSelection()));
                            },
                          ),
                          listItem(
                            title: 'Sign Out',
                            myicon: FaIcon(
                              FontAwesomeIcons.arrowRightFromBracket,
                              color: isDark ? Colors.white : Colors.black,
                            ),
                            onPressed: () async {
                              await showLogOutDialog();
                            },
                          ),
                          SizedBox(
                            height: 80,
                          ),
                          SizedBox(height: 10),
                          Image.asset('assets/nextClass.png',height: 100,width: 100,),
                          SizedBox(height: 20,),
                          Center(child: Text('© nextClass 2023' , style: TextStyle(color: isDark ? Colors.white : Colors.black),)),


                        ],
                      ),
                    ],
                  ),
                ));

  }

}
class listItem extends StatelessWidget {
  String title;
  FaIcon myicon;
  Function onPressed;
  var brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;

  listItem(
      {required this.title, required this.myicon, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    bool isDark = brightness == Brightness.dark;
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: isDark ? Colors.white : Colors.black),
      ),
      leading: myicon,
      trailing: FaIcon(
        FontAwesomeIcons.chevronRight,
        color: isDark ? Colors.white : Colors.black,
      ),
      onTap: () {
        onPressed();
      },
    );
  }
}
