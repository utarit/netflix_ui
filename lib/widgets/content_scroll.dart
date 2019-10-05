import "package:flutter/material.dart";

class ContentScroll extends StatelessWidget {
  final List<String> images;
  final String title;
  final double imageHeight;
  final double imageWidth;

  ContentScroll({
    this.images,
    this.title,
    this.imageHeight,
    this.imageWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                onTap: () => print("View $title"),
                child: Icon(Icons.arrow_forward, color: Colors.black, size: 30),
              )
            ],
          ),
        ),
        Container(
          height: imageHeight,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 30),
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              width: imageWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 6.0,
                    )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(images[index], fit: BoxFit.cover)
              ),
            ),
          ),
        )
      ],
    );
  }
}
