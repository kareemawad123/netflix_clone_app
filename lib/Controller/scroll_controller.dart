import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SController extends GetxController {
  final ScrollController controller = ScrollController();
  var isTop = true.obs;

  setTra() => isTop = true.obs;
  setNotTra() => isTop = false.obs;
}
