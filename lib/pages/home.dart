import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CarouselSlider carouselSlider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: <Widget>[
          PopupMenuButton<int>(
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 1,
              child: Text(
                "Sign Out",
                style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.w700),
              ),
            ),
            PopupMenuItem(
            value: 2,
            child: Text(
            "Settings",
              style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.w700),
          ),
          ),
          ],
          elevation: 10,
          padding: EdgeInsets.symmetric(horizontal: 20),
          )
        ],
      ),
      body: new Stack(fit: StackFit.expand, children: <Widget>[
        new Image(
          image: new AssetImage("assets/img2.jpg"),
          fit: BoxFit.cover,
          //color: Colors.black54,
          colorBlendMode: BlendMode.darken,
        ),
        new Container(
          padding: EdgeInsets.fromLTRB(50, 10, 50, 0),
      child: Text(
          "Comrade's Club",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 40.0,
            letterSpacing: 3.0,
            color: Colors.black,
            fontFamily: 'Shadows',
          ),
        ),
      ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 100.0,0, 5.0),
          child: new Container(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              carouselSlider = CarouselSlider(
                height: 250.0,
                initialPage: 0,
                enlargeCenterPage: true,
                autoPlay: true,
                reverse: false,
                enableInfiniteScroll: true,
                autoPlayInterval: Duration(seconds: 2),
                autoPlayAnimationDuration: Duration(milliseconds: 2000),
                pauseAutoPlayOnTouch: Duration(seconds: 10),
                scrollDirection: Axis.horizontal,

              items: <Widget>[
                new Image(
                    image: AssetImage('assets/img5.jpeg'),
                ),
                new Container(
                  child: new Image(
                    image: AssetImage('assets/img3.jpeg'),
                  ),
                ),
                new Container(
                  child: new Image(
                      image: AssetImage('assets/img4.jpeg'),
                  ),
                ),
                new Container(
                  child: new Image(
                    image: AssetImage('assets/img6.jpg'),
                  ),
                ),

              ],
              ),

           SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  OutlineButton(
                    onPressed: goToPrevious,
                    child: Text("<"),
                  ),
                  OutlineButton(
                    onPressed: goToNext,
                    child: Text(">"),
                  ),
                ],
              ),
            ],
          ),),
        )
      ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text("Help"),
        backgroundColor: Colors.black,
      ),
    );
  }
  goToPrevious() {
    carouselSlider.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  goToNext() {
    carouselSlider.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  }
}
