import 'package:flutter/material.dart';

Widget genresText({required String text, color}) {
  return Text(
    text,
    style: TextStyle(color: color != null ? color :  Colors.white70, fontSize: 13),
  );
}

Widget dotIcon({color}) {
  print('Color: ${color}');
  return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Icon(
        Icons.fiber_manual_record,
        color: color != null ? color : Colors.white70,
        size: 5,
      ));
}
