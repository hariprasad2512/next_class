import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:next_class/screens/branch_page.dart';

import '../data/slot.dart';

class UGPage extends StatelessWidget {
  late List<int> ugLevels = [1,2,3,4];
  late int selectedUG;
  final List<Slot> events;
  UGPage({required this.events});
  @override
  Widget build(BuildContext context) {
    Future<void> saveUG(int ug) async {
      try {
        final userRef = FirebaseFirestore.instance.collection('users').doc(
            FirebaseAuth.instance.currentUser?.uid);
        Navigator.push(context, MaterialPageRoute(builder: (context)=> BranchSelection(events: events,ug: selectedUG,)));
        await userRef.update({
          "UG": selectedUG,
        });

        print("Selected subjects updated successfully!");
        // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        //     builder: (context) => BottomBarScreen(events: events)), (
        //     route) => false);
      } catch (e) {
        print("Error updating selected subjects: $e");
      }
    }

    void _onBranchSelected(BuildContext context, int ug) async {

      selectedUG = ugLevels[ug-1];
      saveUG(ug);
    }


    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Select UG Level')),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset("assets/books.json",width: 340,height: 340,repeat: true),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => _onBranchSelected(context, 1),
                    child: Text('UG 1'),
                  ),
                  SizedBox(width: 40,),

                  ElevatedButton(
                    onPressed: () => _onBranchSelected(context, 2),
                    child: Text('UG 2'),
                  ),
                ],
              ),


              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => _onBranchSelected(context, 3),
                    child: Text('UG 3'),
                  ),
                  SizedBox(width: 40),
                  ElevatedButton(
                    onPressed: () => _onBranchSelected(context, 4),
                    child: Text('UG 4'),
                  ),
                ],
              ),

            ],

          ),

        ],
      )

            // child : ListView.builder(
            //   itemCount: ugLevels.length,
            //   itemBuilder: (context, index) {
            //     return ListTile(
            //       title: Center(child: Text('UG : ${ugLevels[index]}')),
            //       onTap: () {
            //         // Navigate to the next page or perform the desired action
            //         // when an UG level is selected.
            //         // For example, you can use Navigator.push() to navigate to another page.
            //         selectedUG = ugLevels[index];
            //         saveUG();
            //       },
            //     );
            //   },
            // ),
    );
  }
}
