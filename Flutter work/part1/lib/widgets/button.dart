import 'package:flutter/material.dart';
import 'package:part1/constants.dart';

Widget primaryButton(double width,
    {required Function() callback, required String title}) {
  return Container(
    constraints: BoxConstraints(minWidth: width),
    child: MaterialButton(
      onPressed: callback,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: primaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}

//outlined button
Widget secondaryButton(double width,
    {required Function() callback, required String title}) {
  return Container(
    constraints: BoxConstraints(minWidth: width),
    child: MaterialButton(
      elevation: 0,
      onPressed: callback,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: primaryColor)),
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Text(
        title,
        style: const TextStyle(color: primaryColor),
      ),
    ),
  );
}
