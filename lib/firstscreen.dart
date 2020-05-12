import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'data.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          SizedBox(
            height: 100,
            child: Container(
              child: Align(
                alignment: Alignment.centerRight,
                child: FlareActor(
                  'assets/Animated orb.flr',
                  alignment: Alignment.bottomRight,
                  fit: BoxFit.contain,
                  // animation: 'Aura',
                ),
              ),
            ),
          ),
          Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      'FACTS',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  SizedBox(height: 50),
                  show(context)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget show(context) {
  double height;
  double width;
  height = MediaQuery.of(context).size.height / 1.5;
  width = MediaQuery.of(context).size.width;

  return Container(
    child: new ConstrainedBox(
      constraints: new BoxConstraints.loose(new Size(width, height)),
      child: new Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(right: 15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(images[index])),
            ),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      stops: [
                        0.1,
                        0.9
                      ],
                      colors: [
                        Colors.black.withOpacity(.8),
                        Colors.black.withOpacity(.1)
                      ])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      'kjfdgjkgfdkjngfjsdfkjg  f ghfhgdshkg hdhgkjd hgjdjgjdfh gdgfgsd hdhgd',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    )),
                  ),
                ],
              ),
            ),
          );
        },
        indicatorLayout: PageIndicatorLayout.COLOR,
        autoplay: false,
        itemCount: images.length,
        // pagination: new SwiperPagination(),
        control: new SwiperControl(),
        viewportFraction: 0.8,
        scale: 0.9,
      ),
    ),
  );
}
