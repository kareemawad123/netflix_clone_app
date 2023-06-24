import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Model/constants.dart';

class CustomPreHomeBG extends StatelessWidget {
  const CustomPreHomeBG(
      {Key? key, required this.color, required this.str1, required this.str2})
      : super(key: key);
  final Color color;
  final String str1;
  final String str2;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      // color: color,
      child: Stack(
        children: [
          Container(
            height: height,
            child: Image(
              image: const NetworkImage(
                'https://cdn0.tnwcdn.com/wp-content/blogs.dir/1/files/2020/02/Netflix-Top-Ten_4.jpg',
              ),
              fit: BoxFit.fill,
              key: UniqueKey(),
            ),
          ),
          Container(
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withAlpha(150),
                  Colors.black.withAlpha(150),
                  // Colors.indigoAccent.withAlpha(150),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 210,
            child: Container(
              // color: Colors.greenAccent,
              width: width,
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    // color: Colors.amberAccent,
                    child: Text(str1,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.archivoBlack(
                            textStyle: const TextStyle(
                          color: Colors.white,
                          height: 1.2,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ))),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 60),
                    child: Text(
                      str2,
                      textAlign: TextAlign.center,
                      style:
                          const TextStyle(color: secondaryColors, fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
