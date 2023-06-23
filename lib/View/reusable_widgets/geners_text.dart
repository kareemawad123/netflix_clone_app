import 'package:flutter/material.dart';

Widget genresText({required String text}){
  return Text(
    text,
    style: const TextStyle(
      color: Colors.white70,
      fontSize: 13
    ),
  );
}

Widget dotIcon(){
  return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: const Icon(
        Icons.fiber_manual_record,
        color: Colors.white70,
        size: 5,
      ));
}