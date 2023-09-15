import 'package:flutter/material.dart';


class RoundedButton extends StatelessWidget {
  Color mycolor;
  String text;
  Function() onPressedfunc;
  RoundedButton(
      {required this.mycolor, required this.text, required this.onPressedfunc});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: mycolor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressedfunc,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
