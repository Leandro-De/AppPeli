import 'dart:convert'; //Convierte los datos de paquetes Json a dart
import 'package:app_pelis_1/models/movie.dart';
import 'package:http/http.dart' as http; //Importa este paquete como http

class ApiClient {
  static const urlBase = 'https://api.themoviedb.org/3/movie/upcoming';
  static const apikey = 'api_key=0c878b10afe06d427dcf9f0dc3875123';
  static const region = 'region=US';

  static String buildPosterUrl(String posterPath) {
    return 'https://image.tmdb.org/t/p/w300$posterPath';
  }

  ///Llamar a la api por por las peliculas

  static Future<List<Movie>> fetchMovies() async {
    final fetchUrl = '$urlBase?$apikey&$region';
    final response = await http.get(fetchUrl);

    if (response.statusCode == 200) {
      final pagesCount = jsonDecode(response.body)[
          'total_pages']; //llamando a la respuesta de json de la api
      var moviesList = <Movie>[]; //variable para almacenar las pelis

      for (int i = 1; i <= pagesCount; i++) {
        final pageResponse =
            await http.get('$fetchUrl&page=$i'); //llamar a cada pagina
        final result = jsonDecode(pageResponse.body)[
            'results']; //sacando los resultados en json de la lista de pelis
        final pageMovies = Movie.fromDynamicList(
            result); //llama al metodo lista dinamica del metodo movie
        moviesList.addAll(pageMovies);
      } //recorrido para ver el numero de paginas

      moviesList = moviesList
          .where((movie) => movie.releaseDate.isAfter(DateTime.now()))
          .toList();

      moviesList.sort((movie, nextMovie) =>
          movie.releaseDate.compareTo(nextMovie.releaseDate));

      return moviesList; //Retorna a la lista de peliculas
    } else {
      throw Exception('Error al obtener pelis de la api');
    }
  }
}
