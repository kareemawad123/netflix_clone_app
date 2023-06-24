import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:netflix_clone_app/Model/constants.dart';
import 'package:netflix_clone_app/View/Screens/HomeScreenN.dart';

class ChoseUserScreen extends StatefulWidget {
  const ChoseUserScreen({Key? key}) : super(key: key);

  @override
  State<ChoseUserScreen> createState() => _ChoseUserScreenState();
}

class _ChoseUserScreenState extends State<ChoseUserScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: tertiaryColors,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: SvgPicture.asset(
            'assets/icons/NetflixLogo.svg',
            width: width * 0.25,
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/icons/pen.svg',
                  width: width * 0.065,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Who's Watching?",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              Container(
                height: height * 0.6,
                width: width * 0.75,
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 25),
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 25,
                  crossAxisCount: 2,
                  children: <Widget>[
                    customUser(
                        name: 'Kareem',
                        img: 'assets/images/user1.png',
                        context: context),
                    customUser(
                        name: 'ASSAS',
                        img: 'assets/images/user2.png',
                        context: context),
                    customUser(
                        name: 'K',
                        img: 'assets/images/user1.png',
                        context: context),
                    customUser(
                        name: 'K',
                        img: 'assets/images/user1.png',
                        context: context),
                    customUser(
                        name: 'Kids',
                        img: 'assets/images/kids.png',
                        context: context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget customUser(
    {required String name,
    required String img,
    required BuildContext context}) {
  return InkWell(
    onTap: () {
      // print('Tap');
      Get.to(const HomeScreenN(), transition: Transition.fade);
    },
    child: Container(
      // color: Colors.green,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.125,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                img,
                // height: 8,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    ),
  );
}
