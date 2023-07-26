import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone_app/Model/constants.dart';
import 'package:netflix_clone_app/View/Screens/Profiles.dart';
import 'package:netflix_clone_app/View/Screens/download.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({Key? key, this.movie}) : super(key: key);
  final dynamic movie;

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // widget.movie;
    // print(widget.movie);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search_rounded,
                    size: 35,
                  ))),
          InkWell(
            onTap: () {
              Get.to(const ProfileScreen(),
                  transition: Transition.rightToLeftWithFade);
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              height: 25,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.asset(
                  'assets/images/user1.png',
                  // height: 8,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(children: [
                Positioned(
                  child: Container(
                    height: height * 0.4,
                    width: width,
                    margin: const EdgeInsets.all(0.0),
                    padding: EdgeInsets.zero,
                    child: ClipRRect(
                        child: Image.network(
                      widget.movie['link'],
                      fit: BoxFit.cover,
                    )),
                  ),
                ),
                Positioned(
                    top: (height * 0.4) * 0.4,
                    left: width*0.4,
                    child: SizedBox(
                      // width: width * 0.5,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.play_circle_outline,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                    )),
              ]),
              SizedBox(
                width: width,
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.movie['name']}',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: secondaryColors),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '19-10-2023'
                      ' | 18+ | 12 Episodes | 2.1 GB',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 12, color: Colors.white70),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [Icon(Icons.play_arrow), Text("Resume")],
                      ),
                      color: Colors.white,
                      hoverColor: Colors.grey,
                      minWidth: double.infinity,
                      height: 40,
                      textColor: Colors.black,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.download_sharp),
                          Text("Download")
                        ],
                      ),
                      color: Color.fromARGB(255, 44, 44, 44),
                      hoverColor: Colors.grey,
                      minWidth: double.infinity,
                      height: 40,
                      textColor: Colors.white,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.movie['description'],
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 12, color: Colors.white70),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(
                          child: Column(
                            children: [
                              Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 30,
                              ),
                              Text(
                                'My List',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11),
                              )
                            ],
                          ),
                        ),
                        const Expanded(
                          child: Column(
                            children: [
                              Icon(
                                Icons.star_rate_sharp,
                                color: Colors.white,
                                size: 30,
                              ),
                              Text(
                                'Rate',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11),
                              )
                            ],
                          ),
                        ),
                        const Expanded(
                          child: Column(
                            children: [
                              Icon(
                                Icons.share,
                                color: Colors.white,
                                size: 30,
                              ),
                              Text(
                                'Share',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: DownloadIndex3(),
                    )
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
