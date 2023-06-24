import 'package:flutter/material.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({Key? key, this.movie}) : super(key: key);
  final dynamic movie;

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    widget.movie;
    return const Placeholder();
  }
}
