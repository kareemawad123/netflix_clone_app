import 'package:dio/dio.dart';

class NetflixApis {
  static getMovies() async {
    final dio = Dio();
    dio.options.headers['X-RapidAPI-Key'] =
        '15f480faf2msh3dda65aaa6f2770p1ec48ejsncde316cdf53b';
    dio.options.headers['X-RapidAPI-Host'] =
        'netflix-unofficial.p.rapidapi.com';
    final response =
        await dio.get('https://netflix-unofficial.p.rapidapi.com/api/genres');
    print(response.data);
  }

  static Future getMovieDB() async {
    final dio = Dio();
    dio.options.queryParameters['api_key'] =
    'a29b764d285577543b22f1b2ee8f8ff5';
    final response =
    await dio.get('https://api.themoviedb.org/3/movie/popular');
    // print(response.data['results']);
    return response.data['results'];
  }
}
