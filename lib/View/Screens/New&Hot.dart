import 'package:flutter/material.dart';

import '../../Controller/movies_controller.dart';
import '../../Model/constants.dart';
import '../reusable_widgets/geners_text.dart';

class NewHotScreen extends StatefulWidget {
  const NewHotScreen({Key? key}) : super(key: key);

  @override
  State<NewHotScreen> createState() => _NewHotScreenState();
}

class _NewHotScreenState extends State<NewHotScreen> {
  late List movies;
  bool isLoad = true;

  void getMovies() async {
    movies = await MoviesCore.setMovies();
    if (movies.isNotEmpty) {
      isLoad = false;
    }
    setState(() {});
    //print(movies);
  }

  @override
  void initState() {
    super.initState();
    getMovies();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return isLoad
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView(
            children: [
              comingWidget(
                  context: context,
                  title: movies[2]['original_title'],
                  description: movies[2]['overview'],
                  date: '17',
                  poster: movies[2]['backdrop_path']),
              comingWidget(
                  context: context,
                  title: movies[3]['original_title'],
                  description: movies[3]['overview'],
                  date: '23',
                  poster: movies[3]['backdrop_path']),
              comingWidget(
                  context: context,
                  title: movies[6]['original_title'],
                  description: movies[6]['overview'],
                  date: '5',
                  poster: movies[6]['backdrop_path']),
            ],
          );
  }

  Widget comingWidget(
      {required BuildContext context,
      required String poster,
      required String title,
      required String description,
      required String date}) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      // width: width,
      // height: height * 0.55,
      // color: Colors.grey,
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: width * 0.2,
            // color: Colors.amberAccent,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'JUL',
                  style: TextStyle(
                      color: secondaryColors,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      height: 0),
                ),
                Text(
                  date,
                  style: const TextStyle(
                      color: secondaryColors,
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                      height: 0),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: width * 0.77,
                  height: height * 0.2,
                  // color: Colors.amberAccent,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500/$poster',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  width: width * 0.8,
                  padding: const EdgeInsets.only(right: 10, top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: width * 0.45,
                        // color: Colors.red,
                        child: Text(
                          title,
                          style: const TextStyle(
                            color: secondaryColors,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(child: Container()),
                      const InkWell(
                        child: Column(
                          children: [
                            Icon(
                              Icons.add_alert_outlined,
                              color: secondaryColors,
                            ),
                            Text(
                              'Remind Me',
                              style: TextStyle(
                                fontSize: 14,
                                color: secondaryColors,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: const InkWell(
                          child: Column(
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: secondaryColors,
                              ),
                              Text(
                                'Info',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: secondaryColors,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Coming Friday",
                  style: TextStyle(
                      color: secondaryColors,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  // color: Colors.greenAccent,
                  width: width * 0.77,
                  child: Text(
                    description,
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ),
                Container(
                  width: width * 0.77,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      genresText(text: 'Drama', color: Colors.white),
                      dotIcon(color: Colors.white),
                      genresText(text: 'Crime', color: Colors.white),
                      dotIcon(color: Colors.white),
                      genresText(text: 'Period Pieces', color: Colors.white),
                      dotIcon(color: Colors.white),
                      genresText(text: 'Made in Europe', color: Colors.white),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
