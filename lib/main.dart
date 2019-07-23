import 'package:flutter/material.dart';
import 'package:flutterui_05/data.dart';
import 'package:flutterui_05/pageIndicator.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;

  void _nextImage() {
    setState(() {
      if (currentIndex < productImage.length - 1) {
        currentIndex++;
      } else {
        currentIndex = currentIndex;
      }
    });
  }

  void _prevImage() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      } else {
        currentIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              ClipRRect(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(60)),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(
                        productImage[currentIndex],
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 40,
                        left: 20,
                        child: IconButton(
                          icon: Icon(Icons.block, size: 20),
                          onPressed: () {},
                        ),
                      ),
                      Positioned(
                        top: 150.0,
                        left: 35.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              productTitle[currentIndex],
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text(" game of the year",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 40.0),
                            Text(price[currentIndex] + "\$",
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                            SizedBox(height: 40.0),
                            SizedBox(
                              width: 70.0,
                              child: PageIndicator(
                                  currentIndex, productImage.length),
                            ),
                          ],
                        ),
                      ),
                      Positioned.fill(
                        child: GestureDetector(
                          onHorizontalDragEnd: (DragEndDetails details) {
                            if (details.velocity.pixelsPerSecond.dx > 0) {
                              _prevImage();
                            } else if (details.velocity.pixelsPerSecond.dx <
                                0) {
                              _nextImage();
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "The Greatest Games",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "ludum dare ipsum is a ludum dare iptsirm because you now that lurem ipsum is what you can talk about ipsumm",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            right: 0.0,
            bottom: 0.0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0)),
              child: SizedBox(
                height: 60.0,
                width: 160.0,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        color: Color(0xFFfa7b58),
                        child: Center(
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Color(0xFF2a2d3f),
                        child: Center(
                          child: Icon(
                            Icons.shopping_basket,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
