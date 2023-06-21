import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone_app/View/Screens/registeration.dart';

class BottomSheetExample extends StatelessWidget {
  const BottomSheetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          child: const Text('showModalBottomSheet'),
          onPressed: () {
            Get.to(Registeration());
          }),
    );
  }
}
