import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:netflix_clone_app/View/Screens/HomeScreenN.dart';
import 'package:netflix_clone_app/View/Screens/pre_home.dart';
import 'package:netflix_clone_app/View/Screens/users.dart';
import 'Controller/scroll_controller.dart';
import 'firebase_options.dart';

void main() async{
  Get.put(SController());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const HomeScreen(),
      home: const ChoseUserScreen(),
      // home: const HomeScreenN(),
    );
  }
}
