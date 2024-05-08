// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class Colorclass {
  Color background_color = const Color.fromARGB(255, 22, 156, 145);
  Color container_color = const Color(0xff2F7E79);
  Color white_color = const Color.fromARGB(203, 255, 255, 255);
  Color blackcolor = const Color.fromARGB(255, 0, 0, 0);
  TextStyle textstyle = const TextStyle(
      letterSpacing: 2,
      color: Colors.white,
      fontSize: 44,
      fontWeight: FontWeight.w500);
  TextStyle textstyle_button = const TextStyle(
      // letterSpacing: 2,
      color: Colors.white,
      fontSize: 32,
      fontWeight: FontWeight.w500);
  TextStyle textstyle_green = const TextStyle(
      color: Color(0xff2F7E79), fontSize: 36, fontWeight: FontWeight.w600);

  TextStyle textstyle_normal = const TextStyle(
      // letterSpacing: 2,
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.w500);
  TextStyle textstyle_normal_black = const TextStyle(
      // letterSpacing: 2,
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.w500);
  TextStyle textstyle_normal_black_text = const TextStyle(
    // letterSpacing: 2,
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
  TextStyle textstyle_normal_white_text = const TextStyle(
    // letterSpacing: 2,
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
  TextStyle textstyle_rupees_gain = const TextStyle(
      // letterSpacing: 2,
      color: Colors.green,
      fontSize: 16,
      fontWeight: FontWeight.w400);
  TextStyle textstyle_rupees_loss = const TextStyle(
      // letterSpacing: 2,
      color: Colors.red,
      fontSize: 16,
      fontWeight: FontWeight.w400);
}
