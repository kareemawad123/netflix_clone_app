import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import '../../Controller/api_get_controller.dart';
import '../../Controller/movies_controller.dart';
import '../../Controller/scroll_controller.dart';
import '../../Controller/search_controller.dart';
import '../../Model/constants.dart';
import '../reusable_widgets/geners_text.dart';
import '../reusable_widgets/slider_card.dart';

class HomeIndex1 extends StatefulWidget {
  const HomeIndex1({Key? key}) : super(key: key);

  @override
  State<HomeIndex1> createState() => _HomeIndex1State();
}

class _HomeIndex1State extends State<HomeIndex1> {
  late List movies;
  bool isLoad = true;
  String preLinkImg = 'https://image.tmdb.org/t/p/w500/';
  List sliderTitles = [
    'My List',
    'Popular on Netflix',
    'Trending Now',
    'Swoonworthy TV Shows',
    'Exciting Revenge TV Shows',
    'Empowered Women',
    'New Releases',
    'Only on Netflix',
  ];

  // void getMovies() async {
  //   movies = await MoviesCore.setMovies();
  //   if (movies.isNotEmpty) {
  //     isLoad = false;
  //   }
  //   setState(() {});
  //   //print(movies);
  // }
  void getMovies() async {
    movies = await SearchAPI.getData();
    if (movies.isNotEmpty) {
      isLoad = false;
      // print('movies');
      // print(movies);
    }
    setState(() {});
    //print(movies);
  }

  final SController sC = Get.find();

  @override
  void initState() {
    getMovies();
    super.initState();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    // controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return isLoad
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : SingleChildScrollView(
            controller: sC.controller,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.65,
                  // color: Colors.blue,
                  child: Stack(
                    children: [
                      Container(
                          height: height * 0.65,
                          width: width,
                          padding: EdgeInsets.zero,
                          margin: EdgeInsets.zero,
                          child: Image(
                            image: const NetworkImage(
                              'https://images.justwatch.com/poster/301078631/s592/wednesday.webp',
                            ),
                            key: UniqueKey(),
                          )),
                      Container(
                        height: height * 0.65,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: const Alignment(1, 0),
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              tertiaryColors.withAlpha(220)
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 100,
                          child: Container(
                            width: width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                genresText(text: 'Drama'),
                                dotIcon(),
                                genresText(text: 'Crime'),
                                dotIcon(),
                                genresText(text: 'Period Pieces'),
                                dotIcon(),
                                genresText(text: 'Made in Europe'),
                              ],
                            ),
                          )),
                      Positioned(
                        bottom: 20,
                        child: Container(
                          width: width,
                          child: Row(
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
                              SizedBox(
                                width: width * 0.19,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: tertiaryColors,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: const Text(
                                    'Play',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                              const Expanded(
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.info_outline,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    Text(
                                      'Info',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 11),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                // customSlider(profileName: 'Kareem'),
                customCWSliderAPI(profileName: 'Kareem', count: 12),
                ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: sliderTitles.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return customSliderAPI(title: sliderTitles[index]);
                    }),
                // customSliderAPI(title: 'Kareem'),
                // customSlider(title: 'ttttttt'),
                // customSlider(title: 'ttttttt'),
                // customSlider(title: 'ttttttt'),
                // customSlider(),
                // customSlider(),
                // customSlider(),
                // customSlider(),
              ],
            ),
          );
  }
  Widget customSliderAPI({required String title}) {
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
      // height: 150,
      // color: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 3, left: 5),
            height: 140,
            child: ListView.builder(
              itemCount: 18,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
              return customSliderCard2(movie: movies[index]);
            }),
          ),
        ],
      ),
    );
  }
  Widget customCWSliderAPI({required String profileName, required int count}) {
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
      // height: 150,
      // color: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text(
              'Continue Watching for $profileName',
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 3, left: 5),
            height: 180,
            // color: Colors.grey,
            child: ListView.builder(
                itemCount: count,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return customSliderCWCard(movie: movies[index]);
                }),
          ),
        ],
      ),
    );
  }

  // Widget customSlider({required String title}) {
  //   return Container(
  //     padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
  //     // height: 150,
  //     // color: Colors.grey,
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         Container(
  //           margin: const EdgeInsets.only(left: 10),
  //           child: Text(
  //             title,
  //             textAlign: TextAlign.start,
  //             style: const TextStyle(
  //               color: Colors.white,
  //               fontSize: 18,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //         ),
  //         Container(
  //           margin: const EdgeInsets.only(top: 3, left: 5),
  //           height: 140,
  //           child: StreamBuilder<QuerySnapshot>(
  //               stream: FirebaseFirestore.instance
  //                   .collection('NetflixClone')
  //                   .snapshots(),
  //               builder: (BuildContext context,
  //                   AsyncSnapshot<QuerySnapshot> snapshot) {
  //                 if (snapshot.hasError) {
  //                   return const Text('Something went wrong');
  //                 }
  //                 if (snapshot.connectionState == ConnectionState.waiting) {
  //                   return const Center(child: CircularProgressIndicator());
  //                 }
  //                 return SingleChildScrollView(
  //                   scrollDirection: Axis.horizontal,
  //                   child: Row(
  //                     // scrollDirection: Axis.horizontal,
  //                     children:
  //                     snapshot.data!.docs.map((DocumentSnapshot document) {
  //                       Map<String, dynamic> data =
  //                       document.data()! as Map<String, dynamic>;
  //                       return customSliderCard2(movie: data);
  //                     }).toList(),
  //                   ),
  //                 );
  //               },),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //
  // Widget customCWSlider({required String profileName}) {
  //   return Container(
  //     padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
  //     // height: 150,
  //     // color: Colors.grey,
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         Container(
  //           margin: const EdgeInsets.only(left: 10),
  //           child: Text(
  //             'Continue Watching for $profileName',
  //             textAlign: TextAlign.start,
  //             style: const TextStyle(
  //               color: Colors.white,
  //               fontSize: 18,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //         ),
  //         Container(
  //           margin: const EdgeInsets.only(top: 3, left: 5),
  //           height: 180,
  //           // color: Colors.grey,
  //           child: StreamBuilder<QuerySnapshot>(
  //             stream: FirebaseFirestore.instance
  //                 .collection('NetflixClone').where('type', isEqualTo:'Movies')
  //                 .snapshots(),
  //             builder: (BuildContext context,
  //                 AsyncSnapshot<QuerySnapshot> snapshot) {
  //               if (snapshot.hasError) {
  //                 return const Text('Something went wrong');
  //               }
  //               if (snapshot.connectionState == ConnectionState.waiting) {
  //                 return const Center(child: CircularProgressIndicator());
  //               }
  //               return SingleChildScrollView(
  //                 scrollDirection: Axis.horizontal,
  //                 child: Row(
  //                   children:
  //                   snapshot.data!.docs.map((DocumentSnapshot document) {
  //                     Map<String, dynamic> data =
  //                     document.data()! as Map<String, dynamic>;
  //                     return customSliderCWCard(movie: data);
  //                   }).toList(),
  //                 ),
  //               );
  //             },),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
