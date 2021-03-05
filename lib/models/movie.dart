import 'package:flutter/material.dart';

class Movie {
  Movie({
    this.overview,
    this.popularity,
    this.posterPath,
    this.title,
    this.voteAverage,
    this.releaseDate,
  });

  final String overview;
  final double popularity;
  final String posterPath;
  final String title;
  final double voteAverage;
  final DateTime releaseDate;

//mapeando lista para convertir los elementos
  static List<Movie> fromDynamicList(List<dynamic> list) {
    return list.map((json) => fromJson(json)).toList();
  }

//Convierte los datos de json a dart
  static Movie fromJson(dynamic json) {
    return Movie(
      overview: json['overview'],
      popularity: double.tryParse(json['popularity'].toString()),
      posterPath: json['poster_path'],
      title: json['title'],
      voteAverage: double.tryParse(json['vote_avarege'].toString()),
      releaseDate: DateTime.tryParse(json['release_date']),
    );
  }
}
