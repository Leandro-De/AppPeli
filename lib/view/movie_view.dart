import 'package:app_pelis_1/Core/api_client.dart';
import 'package:app_pelis_1/models/movie.dart';
import 'package:flutter/material.dart';

import 'despliegue_card.dart';

class MovieView extends StatelessWidget {
  MovieView({this.movie});

  final Movie movie;
  Widget build(BuildContext context) {
    final imageHeight =
        125.0; // Delimitar el tamaño de la imagen y se llama en los hijos de la fila
    final imageWidth = imageHeight * 0.66;

    return Padding(
        padding: EdgeInsets.symmetric(
          //Espaciado en las cards
          vertical: 3.0,
          horizontal: 7.0,
        ),
        child: Card(
            clipBehavior:
                Clip.hardEdge, // Fuerza a las imgs no salirse de la card

            //Funcion: cuando se seleccione una card se despliegue
            child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Despliegue(
                          movie: movie,
                        );
                      });
                },
                child: Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Alinear el Layout al inicio
                  children: [
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
                            padding: const EdgeInsets.symmetric(
                              vertical: 18,
                              horizontal: 12,
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(movie.title,
                                      overflow: TextOverflow
                                          .ellipsis, //alinear los titulos y tamaño
                                      style: TextStyle(
                                        fontSize: 25,
                                      )),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                ])))
                  ],
                ))));
  }
}
