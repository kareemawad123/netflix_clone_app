import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netflix_clone_app/View/Screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Registeration extends StatefulWidget {
  Registeration({super.key});

  @override
  State<Registeration> createState() => _RegisterationState();
}

class _RegisterationState extends State<Registeration> {
  var email = TextEditingController();
  var _password = TextEditingController();
  var _passwdVisible = true;
  bool checkBoxValue = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              onPressed: () {},
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
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      height: 10,
                    ),
                    Text(
                      "Create an account and we'll send you an email with everything you need to know about Netflix.",
                      style: TextStyle(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey),
                          top: BorderSide(color: Colors.grey),
                          left: BorderSide(color: Colors.grey),
                          right: BorderSide(color: Colors.grey),
                        ),
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "Email",
                          filled: true,
                          fillColor: Colors.white,
                          labelStyle: TextStyle(color: Colors.grey),
                        ),
                        controller: email,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey),
                          top: BorderSide(color: Colors.grey),
                          left: BorderSide(color: Colors.grey),
                          right: BorderSide(color: Colors.grey),
                        ),
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _passwdVisible,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: TextStyle(color: Colors.black),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required!';
                          } else if (value.length <= 6) {
                            return 'Your password should be between 6 and 60 characters';
                          } else {
                            return null;
                          }
                        },
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "Password",
                          filled: true,
                          fillColor: Colors.white,
                          labelStyle: TextStyle(color: Colors.grey),
                        ),
                        controller: _password,
                      ),
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
                      title: Text(
                          "Please do not email me Netflix special offers."),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: email.text,
                                    password: _password.text);
                            // Get.to( ());
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              print('No user found for that email.');
                            } else if (e.code == 'wrong-password') {
                              print('Wrong password provided for that user.');
                            }
                          }
                        }
                      },
                      child: Text("CONTINUE"),
                      color: Colors.red,
                      hoverColor: Color.fromARGB(255, 223, 101, 93),
                      minWidth: double.infinity,
                      height: 60,
                      // shape: Border(
                      //   bottom: BorderSide(
                      //       color: Colors.red),
                      //   top: BorderSide(
                      //       color: Colors.red),
                      //   left: BorderSide(
                      //       color: Colors.red),
                      //   right: BorderSide(
                      //       color: Colors.red),
                      // ),
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
        ),
      ),
    );
  }
}
