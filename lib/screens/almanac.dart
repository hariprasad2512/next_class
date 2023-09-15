import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Almanac extends StatefulWidget {
  Almanac({super.key});

  @override
  State<Almanac> createState() => _AlmanacState();
}

class _AlmanacState extends State<Almanac> {
  var brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;

  @override
  Widget build(BuildContext context) {
    bool isDark = brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      appBar: AppBar(
backgroundColor: isDark ? Colors.black : Colors.white,
        title:Row(
        children: [
        Image.asset('assets/nextClass.png',height: 40,width: 40,),
    SizedBox(width: 20,),
    Center(child: Text('Almanac',style: TextStyle(color: isDark ? Colors.white : Colors.black),)),
    ],
      ),),
      body:SfPdfViewer.asset(
        'assets/almanac.pdf')
    );
  }
}
