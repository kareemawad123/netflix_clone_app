import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:netflix_clone_app/View/Screens/home.dart';
import 'package:netflix_clone_app/View/Screens/pre_home.dart';

class logIn extends StatefulWidget {
  logIn({super.key});

  @override
  State<logIn> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<logIn> {
  var email = TextEditingController();
  var _password = TextEditingController();
  var _passwdVisible = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: SvgPicture.asset(
          'assets/icons/NetflixLogo.svg',
          // fit: BoxFit.contain,
          height: 32,
          width: 50,
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Email or phone number",
                    filled: true,
                    fillColor: Color.fromARGB(255, 48, 47, 47),
                    focusColor: Color.fromARGB(255, 20, 20, 20),
                    labelStyle: TextStyle(color: Colors.grey),
                  ),
                  controller: email,
                  style: TextStyle(color: Colors.white),
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     // print('Please enter your Email ');
                  //     return 'Please enter your Email ';
                  //   } else {
                  //     return null;
                  //   }
                  // }
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _passwdVisible,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Your password must contain between 4 and 60 characters';
                    } else if (value.length <= 4) {
                      return 'Your password must contain between 4 and 60 characters';
                    } else {
                      return null;
                    }
                  },
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Password",
                    filled: true,
                    fillColor: Color.fromARGB(255, 48, 47, 47),
                    focusColor: Color.fromARGB(255, 20, 20, 20),
                    labelStyle: TextStyle(color: Colors.grey),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(
                          () {
                            _passwdVisible = !_passwdVisible;
                          },
                        );
                      },
                      icon: Icon(_passwdVisible
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),
                  controller: _password,
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: email.text, password: _password.text);
                        Get.to(PreHomeScreen());
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                        }
                      }
                    }
                  },
                  child: Text("Sign In"),
                  color: Colors.black,
                  hoverColor: Colors.grey,
                  minWidth: double.infinity,
                  height: 60,
                  shape: Border(
                    bottom: BorderSide(
                        color: const Color.fromARGB(255, 126, 125, 125)),
                    top: BorderSide(
                        color: const Color.fromARGB(255, 126, 125, 125)),
                    left: BorderSide(
                        color: const Color.fromARGB(255, 126, 125, 125)),
                    right: BorderSide(
                        color: const Color.fromARGB(255, 126, 125, 125)),
                  ),
                  textColor: Colors.white,
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    Get.to("/");
                  },
                  child: Text(
                    "Need help?",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    Get.to(PreHomeScreen());
                  },
                  child: Text(
                    "New to Netflix? Sign up now",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Sign in is protected by Google reCAPTCHA to encure you're not a bot.",
                  style: TextStyle(
                    color: Color.fromARGB(255, 94, 93, 93),
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(
                    "The information collected by Google reCAPTCHA is subject to the Google Privacy Policy and terms of Service ,and is used for providing ,maintaining ,and improving the reCAPTCHA service and for general security purposes (it is not used for personalized advertising by Google)",
                    style: TextStyle(
                        color: Color.fromARGB(255, 94, 93, 93), fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
