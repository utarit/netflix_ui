import "package:flutter/material.dart";
import 'package:netflix_design/models/movie_model.dart';
import 'package:netflix_design/widgets/circular_clipper.dart';
import 'package:netflix_design/widgets/content_scroll.dart';

class MovieScreen extends StatefulWidget {
  final Movie movie;

  MovieScreen({this.movie});
  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  transform: Matrix4.translationValues(0.0, -50, 0),
                  child: Hero(
                    tag: widget.movie.imageUrl,
                    child: ClipShadowPath(
                      clipper: CircularClipper(),
                      shadow: Shadow(blurRadius: 20),
                      child: Image(
                        height: 400,
                        width: double.infinity,
                        image: AssetImage(
                          widget.movie.imageUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      padding: EdgeInsets.only(left: 30),
                      icon: Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                      iconSize: 30,
                      color: Colors.black,
                    ),
                    Image(
                      image: AssetImage('assets/images/netflix_logo.png'),
                      height: 60.0,
                      width: 150.0,
                    ),
                    IconButton(
                      padding: EdgeInsets.only(right: 30.0),
                      onPressed: () => print('Add to Favorites'),
                      icon: Icon(Icons.favorite_border),
                      iconSize: 30.0,
                      color: Colors.black,
                    ),
                  ],
                ),
                Positioned.fill(
                  bottom: 10,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RawMaterialButton(
                      elevation: 12,
                      onPressed: () => print("Play"),
                      fillColor: Colors.white,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.play_arrow,
                        size: 60.0,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 20,
                  child: IconButton(
                    onPressed: () => print('Add to My List'),
                    icon: Icon(Icons.add),
                    iconSize: 40.0,
                    color: Colors.black,
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  right: 25.0,
                  child: IconButton(
                    onPressed: () => print('Share'),
                    icon: Icon(Icons.share),
                    iconSize: 35.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    widget.movie.title.toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.movie.categories,
                    style: TextStyle(color: Colors.black54, fontSize: 16),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    '⭐ ⭐ ⭐ ⭐',
                    style: TextStyle(fontSize: 25.0),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            'Year',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(height: 2.0),
                          Text(
                            widget.movie.year.toString(),
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            'Country',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(height: 2.0),
                          Text(
                            widget.movie.country.toUpperCase(),
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            'Length',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(height: 2.0),
                          Text(
                            '${widget.movie.length} min',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 25.0),
                  Container(
                      height: 120,
                      child: SingleChildScrollView(
                        child: Text(widget.movie.description,
                            style: TextStyle(color: Colors.black54)),
                      ))
                ],
              ),
            ),
            ContentScroll(
              images: widget.movie.screenshots,
              title: 'Screenshots',
              imageHeight: 200.0,
              imageWidth: 250.0,
            )
          ],
        ));
  }
}
