import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:next_class/screens/subjects_page.dart';

class BranchSelection extends StatelessWidget {
  List<String> cse = ['FDFED 1','FDFED 2','FDFED 3','IDA','CC','BTA','CD','GTA','NLP','ML 1','ML 2','ICS 1','ICS 2','MIA','IR','DM','CGM'];
  List<String> ece =['VLSI','DSP','PR','WC','MPMC','EP','ICPS'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
          ],
        ),
      ),
    );
  }

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
        Navigator.push((context),MaterialPageRoute(builder: (context)=>Subjects(subjects: cse,)));
      }
      else{
        Navigator.push((context),MaterialPageRoute(builder: (context)=>Subjects(subjects: ece,)));

      }
    //   } catch (e) {
    //   print('Error saving branch to Firestore: $e');
    //   // Handle the error, e.g., show an error message.
    // }
  }
}
