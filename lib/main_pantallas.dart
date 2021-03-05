import 'package:app_pelis_1/view/movie_view.dart';
import 'package:flutter/material.dart';

import 'Core/api_client.dart';
//import 'Core/api_top.dart';
import 'models/movie.dart';

class MainPantallas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Metodo context para saber donde esta

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            title: Text('Peliculas Recomendadas'),
            // backgroundColor: Colors.orange[400],
            bottom: TabBar(tabs: <Widget>[
              //Barra superior
              Tab(text: "Inicio"),
              Tab(text: "Top 10"),
            ])),
        //Metodo para llamar la lsita de pelis
        body: TabBarView(children: <Widget>[
          Center(
              // Inicio
              child: FutureBuilder<List<Movie>>(
                  future: ApiClient.fetchMovies(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final moviesList = snapshot.data;
                      return ListView.builder(
                          itemCount: moviesList.length,
                          itemBuilder: (context, index) {
                            return MovieView(
                              movie: moviesList[index],
                            );
                          });
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  })),
          Center(
            child: Text("Top10(No llama a la Api)"),
          ),
          // Center( //Top10-Nofunciono :(
          // child: FutureBuilder<List<Movie>>(
          //   future: ApiTop.fetchMovies(),
          // builder: (context, snapshot) {
          // if (snapshot.hasData) {
          // final moviesList = snapshot.data;
          //return ListView.builder(
          //  itemCount: moviesList.length,
          //itemBuilder: (context, index) {
          //return MovieView(
          //movie: moviesList[index],
          //);
          //});
          // } else {
          // return Center(
          // child: CircularProgressIndicator(),
          //);
          //}
          //}),
          //),
        ]),
      ),
    );
  }
}
