import 'package:get/get.dart';
import 'package:netflix_clone_app/Model/RapidAPi.dart';

import 'api_get_controller.dart';

class MoviesCore {
  static setMovies() async {
    return await NetflixApis.getMovieDB();
  }
}
