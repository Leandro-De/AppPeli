import 'package:app_pelis_1/Core/api_client.dart';
import 'package:app_pelis_1/models/movie.dart';
import 'package:flutter/material.dart';

class Despliegue extends StatelessWidget {
  Despliegue({
    this.movie,
  });
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final imageHeight = 200.0;
    final imageWidth = imageHeight * 0.66;
    return Container(
        height: movie.overview.isNotEmpty ? null : 270,
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              if (movie.posterPath !=
                  null) //comprueba si la imagen de portada no viene nulo
                Image.network(
                  ApiClient.buildPosterUrl(movie.posterPath),
                  height: imageHeight,
                  width: imageWidth,
                )
              else
                Container(
                  // en caso que no se muestre la portada poner un icon
                  height: imageHeight,
                  width: imageWidth,
                  color: Colors.black12,
                  child: Icon(Icons.movie_sharp, size: 50),
                ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(children: [
                          Icon(
                            Icons.star,
                          ),
                          Text(
                            movie.releaseDate.toString(),
                            style: TextStyle(fontSize: 15),
                          )
                        ]),
                        SizedBox(
                          height: 12,
                        ),
                        Row(children: [
                          Icon(Icons.star),
                          Text(
                            movie.voteAverage.toString(),
                            style: TextStyle(fontSize: 15),
                          )
                        ]),
                        SizedBox(
                          height: 12,
                        ),
                        Row(children: [
                          Icon(Icons.thumb_up_alt_outlined),
                          Text(
                            movie.popularity.toString(),
                            style: TextStyle(fontSize: 15),
                          )
                        ]),
                      ]),
                ),
              ),
            ]),
            SizedBox(
              height: 12,
            ),
            Text(movie.overview)
          ],
        ));
  }
}
