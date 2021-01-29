import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:movie_app/models/index.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage(this.movie);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Title ${movie.title} - Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromRGBO(208, 240, 192, 1),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Image.network(movie.mediumCover),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          movie.title,
                          style: TextStyle(color: Colors.black, fontSize: 24.0, fontFamily: 'Arvo'),
                        ),
                      ),
                      Text(
                        '${movie.rating}/10',
                        style: TextStyle(color: Colors.black, fontSize: 20.0, fontFamily: 'Arvo'),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Year',
                          style: TextStyle(color: Colors.black, fontSize: 24.0, fontFamily: 'Arvo'),
                        ),
                      ),
                      Text(
                        movie.year.toString(),
                        style: TextStyle(color: Colors.black, fontSize: 20.0, fontFamily: 'Arvo'),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        'Runtime:',
                        style: TextStyle(color: Colors.black, fontSize: 24.0, fontFamily: 'Arvo'),
                      )),
                      Text(
                        movie.runtime.toString(),
                        style: TextStyle(color: Colors.black, fontSize: 20.0, fontFamily: 'Arvo'),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Summary',
                        style: TextStyle(color: Colors.black, fontSize: 30.0, fontFamily: 'Arvo'),
                      ),
                      Text(
                        movie.summary,
                        style: TextStyle(color: Colors.black, fontSize: 16.0, fontFamily: 'Arvo'),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
