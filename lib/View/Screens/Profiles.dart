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
    List<SampleUsers> profileUsers = [
      SampleUsers(userName: "Kareem", image: 'assets/images/smile1.png'),
      SampleUsers(userName: "Rashwan", image: 'assets/images/smile2.png'),
      SampleUsers(userName: "ELKateeb", image: 'assets/images/smile3.png'),
      SampleUsers(userName: "Abdo", image: 'assets/images/smile4.png'),
      SampleUsers(userName: "Kids", image: 'assets/images/kids.png'),
    ];

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          title: const Text(
            'Profiles & More',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
                child: Column(children: [
              Container(
                height: height*0.1,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return activeProfile(
                        userName: profileUsers[index].userName,
                        userImage: profileUsers[index].image);
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: profileUsers.length,
                ),
              ),
               SizedBox(
                height: height*0.02,
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
                        title: const Text(
                          "Manage Profiles",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.left,
                        ))),
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () => {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const ListTile(
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
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () => {},
                child: const ListTile(
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
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () => {},
                child: const ListTile(
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
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () => {},
                child: const ListTile(
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
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () => {Get.to(HelpScreen())},
                child: const ListTile(
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
              const SizedBox(
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
                child: const Text(
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

Widget activeProfile({required String userName, required String userImage}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 5),
    child: TextButton(
      onPressed: () => {Get.to(const HomeScreenN())},
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: 55,
                decoration: BoxDecoration(
                    // color: Colors.amberAccent,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image(
                    image: AssetImage(userImage),
                    fit: BoxFit.fill,
                  ),
                )),
            const SizedBox(
              height: 5,
            ),
            Text(
              " $userName ",
              textAlign: TextAlign.center,
              maxLines: 2,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ),
    ),
  );
}
