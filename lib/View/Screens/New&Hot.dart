import 'package:flutter/material.dart';

import '../../Controller/movies_controller.dart';

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

    return Container(
      // width: width,
      height: height*0.4,
      color: Colors.grey,
      child: Row(
        children: <Widget>[
          Container(
            width: width*0.2,
            color: Colors.amberAccent,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('JUL',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  height: 0
                ),),
                Text('14',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                  height: 0
                ),),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: width*0.77,
                  height: height * 0.2,
                  // color: Colors.amberAccent,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500/${movies[2]['backdrop_path']}',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                        child: Text(movies[2]['original_title'])
                    ),

                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

