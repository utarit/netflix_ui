import 'package:flutter/material.dart';
import 'package:netflix_design/models/movie_model.dart';
import 'package:netflix_design/screens/movie_screen.dart';
import 'package:netflix_design/widgets/content_scroll.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
    super.initState();
  }

  _movieSelector(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 270,
            width: Curves.easeInOut.transform(value) * 400,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => MovieScreen(movie: movies[index]))),
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Center(
                  child: Hero(
                    tag: movies[index].imageUrl,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                        image: AssetImage(movies[index].imageUrl),
                        height: 220.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 30.0,
              bottom: 40.0,
              child: Container(
                width: 250.0,
                child: Text(
                  movies[index].title.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(child: Image.asset("assets/images/netflix_logo.png")),
        leading: IconButton(
          padding: EdgeInsets.only(left: 30),
          onPressed: () => print("Menu pressed"),
          icon: Icon(Icons.menu),
          iconSize: 30.0,
          color: Colors.black,
        ),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 30),
            onPressed: () => print("Search"),
            icon: Icon(Icons.search),
            color: Colors.black,
            iconSize: 30,
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 280,
            width: double.infinity,
            child: PageView.builder(
              controller: _pageController,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return _movieSelector(index);
              },
            ),
          ),
          Container(
            height: 90,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 30),
              scrollDirection: Axis.horizontal,
              itemCount: labels.length,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.all(10),
                width: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFD45253),
                        Color(0xFF9E1F28),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFF9E1F28),
                          offset: Offset(0, 2),
                          blurRadius: 4)
                    ]),
                child: Center(
                  child: Text(
                    labels[index].toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          ContentScroll(
            images: myList,
            title: "My List",
            imageHeight: 250,
            imageWidth: 150,
          ),
          SizedBox(height: 10,),
          ContentScroll(
            images: popular,
            title: 'Popular',
            imageHeight: 250.0,
            imageWidth: 150.0,
          )
        ],
      ),
    );
  }
}
