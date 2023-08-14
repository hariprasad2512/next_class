import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Almanac extends StatefulWidget {
  const Almanac({super.key});

  @override
  State<Almanac> createState() => _AlmanacState();
}

class _AlmanacState extends State<Almanac> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Almanac'),),
      ),
      body:SfPdfViewer.asset(
        'assets/almanac.pdf')
    );
  }
}
