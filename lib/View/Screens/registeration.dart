import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:netflix_clone_app/View/Screens/HelpScreen.dart';
import 'package:netflix_clone_app/View/Screens/login.dart';

class Registration extends StatefulWidget {
  Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  var _passwdVisible = true;
  bool checkBoxValue = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: SvgPicture.asset(
          'assets/icons/NetflixLogo.svg',
          // fit: BoxFit.contain,
          height: 32,
          width: 50,
        ),
        actions: [
          TextButton(
              onPressed: () {
                Get.to(HelpScreen());
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: const Text(
                'HELP',
                style: TextStyle(color: Colors.black, fontSize: 12),
              )),
          SizedBox(
            width: 3,
          ),
          TextButton(
              onPressed: () {
                Get.to(logIn());
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: const Text(
                'LOG IN',
                style: TextStyle(color: Colors.black, fontSize: 12),
              )),
          SizedBox(
            width: 10,
          ),
        ],
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
                Text(
                  "Ready to experience unlimited TV shows & movies?",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Create an account and we'll send you an email with everything you need to know about Netflix.",
                  style: TextStyle(),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required!';
                    } else if (value.length < 5) {
                      InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)));
                      return 'Your Email should be between 5 and 60 characters';
                    } else {
                      return null;
                    }
                  },
                  cursorColor: const Color.fromARGB(255, 100, 100, 100),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    hintText: "Email",
                    filled: true,
                    fillColor: Colors.white,
                    labelStyle: TextStyle(color: Colors.grey),
                  ),
                  controller: _emailController,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _passwdVisible,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required!';
                    } else if (value.length < 6) {
                      InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)));
                      return 'Your password should be between 6 and 60 characters';
                    } else {
                      return null;
                    }
                  },
                  cursorColor: const Color.fromARGB(255, 100, 100, 100),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    hintText: "Password",
                    filled: true,
                    fillColor: Colors.white,
                    focusColor: Colors.blue,
                    labelStyle: TextStyle(color: Colors.grey),
                  ),
                  controller: _passwordController,
                ),
                SizedBox(
                  height: 20,
                ),
                CheckboxListTile(
                  value: checkBoxValue,
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (bool? value) {
                    setState(() {
                      checkBoxValue = value!;
                    });
                  },
                  title: Text("Please do not email me Netflix special offers."),
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () async {
                    // print(email.text +
                    //     checkBoxValue.toString() +
                    //     _password.text);
                    if (_formKey.currentState!.validate()) {
                      try {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                        Get.to(logIn());
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                        }
                      } catch (e) {
                        print(e);
                      }
                    }
                  },
                  child: Text("CONTINUE"),
                  color: Colors.red,
                  hoverColor: Color.fromARGB(255, 223, 101, 93),
                  minWidth: double.infinity,
                  height: 60,
                  textColor: Colors.white,
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
