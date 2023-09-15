import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:next_class/data/timetable.dart';
import 'package:next_class/screens/bottombar.dart';
import '../data/slot.dart';

class Subjects extends StatefulWidget {

  Subjects({required this.subjects,required this.events});
  final List<String> subjects;
  final List<Slot> events;
  @override
  State<Subjects> createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  List<String> selectedSubs = [];
  final String currentUserId = FirebaseAuth.instance.currentUser!.uid;
  void updateSelectedSubjects(String languageCode, bool isChecked) {
    setState(() {
      if (isChecked) {
        selectedSubs.add(languageCode);
      } else {
        selectedSubs.remove(languageCode);
      }
    });
  }

  int getDayOfWeekAsNumber(DateTime date) {
    // DateTime's weekday starts from 1 (Monday) to 7 (Sunday)
    // We need to convert it to our desired format, where Monday is 1, Tuesday is 2, and so on.
    return date.weekday % 7;
  }

  List<String> cse = ['FDFED 1','FDFED 2','FDFED 3','IDA','CC 1','CC 2','BTA','CD','GTA','NLP','ML 1','ML 2','ICS 1','ICS 2','MIA','IR','DM','CGM'];
  List<String> ece =['VLSI','DSP','PR','WC','MPMC','EP','ICPS'];






  Future<void> saveSelectedSubjects() async {
    try {
      final userRef = FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid);

      await userRef.update({
        "selectedSubjects": selectedSubs,
      });
      DateTime now = DateTime.now();
      int dayOfWeekAsNumber = getDayOfWeekAsNumber(now);
      print("Selected subjects updated successfully!");
      Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>BottomBarScreen(events: widget.events,selectedIndex: 1,)),(route)=> false);
    } catch (e) {
      print("Error updating selected subjects: $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Select your Courses'),
        ),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: widget.subjects.length,
        itemBuilder: (context, index) {
          final language = widget.subjects[index];
          final isChecked = selectedSubs.contains(language);

          return CheckboxListTile(
            title: Text(
              language,
            ),
            controlAffinity: ListTileControlAffinity.leading,
            value: isChecked,
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.all(Colors.black),
            onChanged: (bool? value) {
              updateSelectedSubjects(language, value ?? false);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          saveSelectedSubjects();
        },
        label: const Text('Save'),
        icon: Icon(Icons.save),
      ),
    );
  }
}
