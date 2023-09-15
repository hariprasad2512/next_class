import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:next_class/screens/subjects_page.dart';

import '../data/slot.dart';

class BranchSelection extends StatelessWidget {
  List<String> cse = ['FDFED 1','FDFED 2','FDFED 3','IDA UG3','CC 1','CC 2','BTA','CD','GTA','NLP','ML 1','ML 2','ICS 1','ICS 2','MIA','IR','DM','CGM','ICPS UG3','QRA 1','QRA 2','QRA 3','QIC','SE UG3','PGP UG3',];
  List<String> ece =['VLSI','DSP','PR','WC','MPMC','EP','IDA UG3','ICPS UG3','QRA 1','QRA 2','QRA 3','SE UG3','PGP UG3','QIC',];

  List<String> cse2 = ['OOP 1','OOP 2','OOP 3','OOP 4', 'RANAC 1','RANAC 2','RANAC 3','RANAC 4','ADSA 1','ADSA 2','ADSA 3','DBMS 1','DBMS 2','DBMS 3','OS 1','OS 2','OS 3','PC 1','PC 2','PC 3'];
  List<String> ece2 = ['CNA','CS','ES','RANAC 4','OOP 4','PC 1','PC 2','PC 3'];
  List<String> cse1 = ['DSMA 1','DSMA 2','DSMA 3','DSMA 4','DSMA 5','CP 1','CP 2','CP 3','CP 4','CP 5','DLD 1','DLD 2','DLD 3','DLD 4','DLD 5','OCW 1','OCW 2','OCW 3','OCW 4','OCW 5'];
  List<String> ece1 = ['DSMA 1','DSMA 2','DSMA 3','DSMA 4','DSMA 5','CP 1','CP 2','CP 3','CP 4','CP 5','DLD 1','DLD 2','DLD 3','DLD 4','DLD 5','OCW 1','OCW 2','OCW 3','OCW 4','OCW 5'];
  List<String> cse4 = ['FQC','VAR','IOT','ICPS UG4','IDA UG4','CRYPTO','DIP','DTCA','BDA','SCEAI','RL','DSD','MERS','PGP UG4','IAE 1','IAE 2','SE UG4','ITPM','ICT'];
  List<String> ece4 = ['FQC','VAR','IOT','ICPS UG4','IDA UG4','CRYPTO','DIP','DTCA','BDA','SCEAI','RL','DSD','MERS','PGP UG4','IAE 1','IAE 2','SE UG4','ITPM','ICT'];




  final List<Slot> events;
  final int ug;
  BranchSelection({required this.events,required this.ug});
  @override
  Widget build(BuildContext context) {
    Map<int,Map<String,List<String>>> subUGs=
    {
      1: {'CSE': cse1, 'ECE': ece1},
      2: {'CSE': cse2, 'ECE': ece2},
      3: {'CSE': cse, 'ECE': ece},
      4: {'CSE': cse4, 'ECE': ece4},
    };
    void _onBranchSelected(BuildContext context, String branch) async {
      // Add the selected branch to Firestore for the current user
      // User? currentUser = FirebaseAuth.instance.currentUser;
      // if (currentUser == null) {
      //   // User not signed in, handle the error or navigate to sign-in page
      //   return;
      // }
      //
      // CollectionReference usersRef = FirebaseFirestore.instance.collection('users');
      // String uid = currentUser.uid;
      //
      // try {
      //   await usersRef.doc(uid).update({
      //     'branch': branch,
      //   });


      if(branch=='CSE'){
        Navigator.push((context),MaterialPageRoute(builder: (context)=>Subjects(subjects: subUGs[ug]!['CSE'] ?? [],events: events,)));
      }
      else{
        Navigator.push((context),MaterialPageRoute(builder: (context)=>Subjects(subjects: subUGs[ug]!['ECE'] ?? [],events: events,)));

      }
      //   } catch (e) {
      //   print('Error saving branch to Firestore: $e');
      //   // Handle the error, e.g., show an error message.
      // }
    }


    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(icon: Icon(Icons.arrow_back),
      //   onPressed: () {
      //     Navigator.pop(context);
      //   }),
      // ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/boy_falling_cropped.png',width: 250,height: 250,),
              ],
            ),
            Text('Select your Branch',style: TextStyle(fontSize: 30),),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _onBranchSelected(context, 'CSE'),
              child: Text('CSE'),
            ),
            ElevatedButton(
              onPressed: () => _onBranchSelected(context, 'ECE'),
              child: Text('ECE'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset('assets/boy_working.png',width: 180,height: 180,),
              ],
            ),
          ],
        ),
      ),
    );
  }

  }

