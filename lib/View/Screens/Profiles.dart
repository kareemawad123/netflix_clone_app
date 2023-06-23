import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:netflix_clone_app/Model/Users.dart';
import 'package:netflix_clone_app/Model/constants.dart';
import 'package:netflix_clone_app/View/Screens/HelpScreen.dart';
import 'package:netflix_clone_app/View/Screens/HomeScreenN.dart';
import 'package:netflix_clone_app/View/Screens/pre_home.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<SampleUsers> ProfileUsers = [
      SampleUsers(userName: "Kareem", image: 'assets/images/user2.png'),
      SampleUsers(userName: "Rashwan", image: 'assets/images/user1.png'),
      SampleUsers(userName: "ELKateeb", image: 'assets/images/smile2.png'),
      SampleUsers(userName: "Abdo", image: 'assets/images/user1.png'),
      SampleUsers(userName: "Kids", image: 'assets/images/kids.png'),
    ];

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          title: Text(
            'Profiles & More',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
                child: Column(children: [
              Container(
                height: 80,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ActiveProfile(
                        userName: ProfileUsers[index].userName,
                        userImage: ProfileUsers[index].image);
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: ProfileUsers.length,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 250,
                height: 50,
                child: MaterialButton(
                    color: Colors.black,
                    onPressed: () => {},
                    child: ListTile(
                        leading: SvgPicture.asset(
                          'assets/icons/pen.svg',
                          alignment: Alignment.center,
                        ),
                        title: Text(
                          "Manage Profiles",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.left,
                        ))),
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () => {},
                child: ListTile(
                    hoverColor: Colors.grey,
                    tileColor: Color.fromARGB(255, 20, 20, 20),
                    leading: Icon(
                      Icons.notifications_none,
                      color: Colors.white,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                    ),
                    title: Text(
                      "Notifications",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.left,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () => {},
                child: ListTile(
                    hoverColor: Colors.grey,
                    tileColor: Color.fromARGB(255, 20, 20, 20),
                    leading: Icon(
                      Icons.list_alt,
                      color: Colors.white,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                    ),
                    title: Text(
                      "My List",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.left,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () => {},
                child: ListTile(
                    hoverColor: Colors.grey,
                    tileColor: Color.fromARGB(255, 20, 20, 20),
                    leading: Icon(
                      Icons.settings_applications_sharp,
                      color: Colors.white,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                    ),
                    title: Text(
                      "App Settings",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.left,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () => {},
                child: ListTile(
                    hoverColor: Colors.grey,
                    tileColor: Color.fromARGB(255, 20, 20, 20),
                    leading: Icon(
                      Icons.person_4,
                      color: Colors.white,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                    ),
                    title: Text(
                      "Account",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.left,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () => {Get.to(HelpScreen())},
                child: ListTile(
                    hoverColor: Colors.grey,
                    tileColor: Color.fromARGB(255, 20, 20, 20),
                    leading: Icon(
                      Icons.help_outlined,
                      color: Colors.white,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                    ),
                    title: Text(
                      "Help",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.left,
                    )),
              ),
              SizedBox(
                height: 40,
              ),
              MaterialButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut().then((value) {
                    Get.snackbar('LogOut', 'Out Successfully',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: secondaryColors,
                        colorText: quaternaryColors);
                    Get.to(const PreHomeScreen());
                  });
                },
                child: Text(
                  "Sign Out",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey),
                ),
              ),
            ]))));
  }
}

Widget ActiveProfile({required String userName, required String userImage}) {
  return TextButton(
    onPressed: () => {Get.to(HomeScreenN())},
    child: SingleChildScrollView(
      child: Container(
          width: 60,
          child: Column(
            children: [
              Image(
                image: AssetImage('${userImage}'),
                width: 50,
                height: 50,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                " ${userName} ",
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          )),
    ),
  );
}
