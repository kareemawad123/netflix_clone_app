import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_clone_app/Model/constants.dart';

class PreHomeScreen extends StatefulWidget {
  const PreHomeScreen({Key? key}) : super(key: key);

  @override
  State<PreHomeScreen> createState() => _PreHomeScreenState();
}

class _PreHomeScreenState extends State<PreHomeScreen> {
  final List<String> imgList = [
    'https://wallpaperaccess.com/full/112997.jpg',
    'https://wallpaperaccess.com/full/112997.jpg',
    'https://wallpaperaccess.com/full/112997.jpg',
    'https://wallpaperaccess.com/full/112997.jpg',
  ];
  late PageController _pageController =
      _pageController = PageController(viewportFraction: 0.8);
  late var activePage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Stack(children: <Widget>[
          PageView.builder(
              itemCount: imgList.length,
              pageSnapping: true,
              controller: _pageController,
              padEnds: false,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                return Container(
                  height: height,
                  width: double.infinity,
                  color: Colors.lightBlueAccent,
                );
              }),
          Positioned(
            top: 0,
            child: Container(
              width: width,
              height: height * 0.06,
              padding: const EdgeInsets.only(left: 10),
              color: Colors.transparent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      width: 50,
                      margin: const EdgeInsets.only(top: 5),
                      // color: Colors.teal,
                      child: SvgPicture.asset(
                        height: height * 0.05,
                        'assets/icons/Netflix_N_logo.svg',
                        alignment: Alignment.topLeft,
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        // backgroundColor: Colors.grey,
                        padding: const EdgeInsets.only(top: 0, right: 7, left: 0, bottom: 0),
                      ),
                      child: const Text(
                        'PRIVACY',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      )),
                  TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        // backgroundColor: Colors.red,
                        padding: EdgeInsets.zero,
                      ),
                      child: const Text(
                        'LOG IN',
                        style: TextStyle(
                            color: Colors.white,
                            // backgroundColor: Colors.teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      )),
                  IconButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        // backgroundColor: Colors.red,
                        padding: EdgeInsets.zero,
                        minimumSize: const Size.fromRadius(15)
                      ),
                      iconSize: 20,
                      icon: const Icon(
                        Icons.more_vert,
                      )),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: height * 0.1,
            left: width * 0.45,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: indicators(imgList.length, activePage)),
          )
        ]),
      ),
    );
  }
}

List<Widget> indicators(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: EdgeInsets.all(3),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          color: currentIndex == index ? Colors.red : Colors.black26,
          shape: BoxShape.circle),
    );
  });
}
