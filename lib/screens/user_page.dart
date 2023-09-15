
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:next_class/data/slot.dart';
import 'package:next_class/screens/branch_page.dart';
import 'package:next_class/screens/login_screen.dart';
import 'package:next_class/screens/ug_page.dart';


class UserPage extends StatefulWidget {
  final List<Slot> events;
  final int ug;
  UserPage({required this.events,required this.ug});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  int currentIndex = 0;
  late var accentColor = Color(0xffededed);


  late var currentLength = 0;
  late var maxLength = 50;

  var brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;





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
                                builder: (context) => LoginScreen(events: [],)));
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
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: isDark ? Colors.black : Colors.white,
        body: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                                              text: '${firstName ?? "Cadbury"}!',
                                              style: GoogleFonts.playfairDisplay(
                                                  color: isDark
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: 33)),
                                        ],
                                        text: ' Hey there ',
                                        style: GoogleFonts.playfairDisplay(
                                            color: isDark
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 33))),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),

                        ],
                      ),
                      Container(
                        constraints: BoxConstraints(maxWidth: screenWidth * 0.95),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xFF182D3F),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 20,),
                            listItem(
                              title: 'Edit Courses',
                              myicon: FaIcon(
                                FontAwesomeIcons.graduationCap,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UGPage(events: widget.events,)));
                              },
                            ),
                            SizedBox(height: 20,),
                            listItem(
                              title: 'Sign Out',
                              myicon: FaIcon(
                                FontAwesomeIcons.arrowRightFromBracket,
                                color: Colors.black,
                              ),
                              onPressed: () async {
                                await showLogOutDialog();
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),



                          ],
                        ),
                      ),
                      SizedBox(height: 50,),
                      Image.asset('assets/nextClass.png',height: 100,width: 100,),
                      Center(child: Text('© nextClass 2023' , style: TextStyle(color: isDark ? Colors.white : Colors.black),)),
                      SizedBox(height:5,),
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
    final screenWidth = MediaQuery.of(context).size.width;
    bool isDark = brightness == Brightness.dark;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
        leading: myicon,
        trailing: FaIcon(
          FontAwesomeIcons.chevronRight,
          color: Colors.black,
        ),
        onTap: () {
          onPressed();
        },
      ),
    );
  }
}
