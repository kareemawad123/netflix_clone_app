import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';

import '../../Model/constants.dart';

Widget customSliderCard({required var movie}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 5),
    // height: 130,
    width: 100,
    decoration: BoxDecoration(
        color: Colors.red, borderRadius: BorderRadius.circular(7)),
    child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Image.network(
          'https://image.tmdb.org/t/p/w500/${movie['poster_path']}',
          fit: BoxFit.cover,
        )),
  );
}

Widget customSliderCWCard({required var movie}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 5),
    child: Column(
      children: [
        Stack(children: [
          Positioned(
            child: Container(
              height: 130,
              width: 100,
              decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5))),
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.zero,
                      bottomRight: Radius.zero),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500/${movie['poster_path']}',
                    height: 130,
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Positioned(
            child: Container(
              height: 130,
              width: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: const Alignment(0.2, 0.2),
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, tertiaryColors.withAlpha(210)],
                ),
              ),
            ),
          ),
          Positioned(
              top: 35,
              child: SizedBox(
                width: 100,
                child: Align(
                  alignment: Alignment.center,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.play_circle_outline,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
              )),
          const Positioned(
              bottom: 0,
              child: SizedBox(
                  width: 100,
                  child: Text(
                    'Episode 2',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  )))
        ]),
        const SizedBox(
          width: 100,
          child: LinearProgressIndicator(
            minHeight: 3,
            color: quaternaryColors,
            value: 0.7,
            semanticsLabel: 'Linear progress indicator',
          ),
        ),
        Container(
          width: 100,
          height: 40,
          decoration: const BoxDecoration(
            color: primaryColors,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
                topLeft: Radius.zero,
                topRight: Radius.zero),
          ),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.info_outline,
                    color: Colors.white,
                  )),
              Expanded(child: Container()),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  )),
            ],
          ),
        )
      ],
    ),
  );
}
