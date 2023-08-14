import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String currentTime = DateFormat('kk:mm \n').format(now);


    var day = DateFormat('EEEE').format(now);
    return Scaffold(
      appBar: AppBar(title: Text('Next Class')),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Center(
                child: Text(currentTime),
              ),
              Center(
                child: Text(day),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text('Your Class will start in X minutes'),
              ),
              SizedBox(height: 200),
              Center(
                child: Text(
                  'FDFED Sec 1',
                  style: TextStyle(fontSize: 60),
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 40),
                  Center(child: Text('9:45')),
                  SizedBox(width: 200),
                  Center(child: Text('10:45')),
                ],
              ),
              SizedBox(height: 50),
              Center(
                child: Text(
                  'Room : 201',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              SizedBox(height: 100),
              TextButton(
                  onPressed: () {}, child: Text("View Today's Schedule")),
            ],
          ),
        ),
      ),
    );
  }
}
