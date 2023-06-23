import 'package:flutter/material.dart';

import '../../Model/constants.dart';

class CustomPreHomeBG extends StatelessWidget {
  const CustomPreHomeBG({Key? key, required this.color}) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      color: color,
      constraints: BoxConstraints(
        // maxHeight: MediaQuery.of(context).size.height /4,
        maxWidth: MediaQuery.of(context).size.width*0.5 ,
        minWidth: MediaQuery.of(context).size.width*0.5 ,
      ),
      // child: Stack(
      //   children: [
      //     Container(
      //       height: height,
      //       child: Image.network(
      //         'https://cdn0.tnwcdn.com/wp-content/blogs.dir/1/files/2020/02/Netflix-Top-Ten_4.jpg',
      //         fit: BoxFit.fill,
      //       ),
      //     ),
      //     Container(
      //       height: height,
      //       decoration: BoxDecoration(
      //         gradient: LinearGradient(
      //           begin: Alignment.topCenter,
      //           end: Alignment.bottomCenter,
      //           colors: [
      //             Colors.black.withAlpha(150),
      //             Colors.black.withAlpha(150),
      //             // Colors.indigoAccent.withAlpha(150),
      //           ],
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       bottom: 150,
      //       child: Container(
      //         color: Colors.greenAccent,
      //         width: width,
      //         height: height*0.3,
      //         alignment: Alignment.bottomCenter,
      //         child: const Column(
      //           children: [
      //             Text(
      //               'Unlimited movies, TV shows & more',
      //               style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 36,
      //
      //               ),
      //               // maxLines: ,
      //             ),
      //             SizedBox(
      //               height: 10,
      //             ),
      //             Text('Watch anywhere. Cancel anytime.'),
      //           ],
      //         ),
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
