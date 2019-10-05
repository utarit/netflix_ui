import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset("assets/images/netflix_logo.png"),
        leading: IconButton(
          onPressed: () => print("Menu pressed"),
          icon: Icon(Icons.menu),
        ),
      )
    );
  }
}