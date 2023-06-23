import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Controller/movies_controller.dart';
import '../../Model/constants.dart';

class DownloadIndex3 extends StatefulWidget {
  const DownloadIndex3({Key? key}) : super(key: key);

  @override
  State<DownloadIndex3> createState() => _DownloadIndex3State();
}

class _DownloadIndex3State extends State<DownloadIndex3> {
  late List movies;
  bool isLoad = true;

  void getMovies() async {
    movies = await MoviesCore.setMovies();
    if (movies.isNotEmpty) {
      isLoad = false;
    }
    setState(() {});
    print(movies);
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
        ? const Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(left: 5, right: 5, top: 20),
              // color: Colors.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: width * 0.03),
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
                        const Text(
                          'Kareem',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: secondaryColors),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 15,
                    shrinkWrap: true,
                    itemBuilder: (context, index){
                      return Container(
                        // color: Colors.greenAccent,
                        margin: const EdgeInsets.only(bottom: 10),
                        height: height * 0.11,
                        width: width,
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: width * 0.02),
                              width: width * 0.38,
                              height: height * 0.13,
                              // color: Colors.amberAccent,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/w500/${movies[index]['backdrop_path']}',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${movies[index]['original_title']}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: secondaryColors),
                                  ),
                                  const Text(
                                    '18+ | 12 Episodes | 2.1 GB',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white70),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.only(right: 0),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white70,
                                    size: 16,
                                  ),
                                )),
                          ],
                        ),
                      );
                    }

                  ),
                ],
              ),
            ),
          );
  }
}
