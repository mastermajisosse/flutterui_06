import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutterui_05/data.dart';

// import 'package:tes8/productCart.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const IconData search = IconData(59574, fontFamily: 'MaterialIcons');
  static const IconData menu = IconData(58834, fontFamily: 'MaterialIcons');
  Color color1 = const Color(0xFFf2f3f8);
  int _currentIndex = 0;

  Widget _buildGradiantConstraint(double width, double height) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: width * .8,
        height: height / 2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFFfbfcfd), color1],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.5, 1.0]),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Positioned(
      top: 40.0,
      left: 20.0,
      right: 20.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(menu, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(double height) {
    return Positioned(
      top: height * .2,
      left: 30.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "wooden armchair",
            style: TextStyle(fontSize: 28.0),
          ),
          Text(
            "loream ipsum",
            style: TextStyle(fontSize: 15.0),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: color1,
      body:
          // SingleChildScrollView(child: LayoutBuilder,)
          LayoutBuilder(
        builder: (context, constraint) {
          var width = constraint.maxWidth;
          var height = constraint.maxHeight;

          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              _buildGradiantConstraint(width, height),
              _buildAppBar(),
              _buildTitle(height),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: height * .65,
                  child: ListView.builder(
                    itemCount: images.length,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 35.0, bottom: 50.0),
                        child: SizedBox(
                          width: 200.0,
                          child: Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 45.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: (index % 2 == 0)
                                          ? Colors.white
                                          : Color(0xFF2a2d3f),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black12,
                                            offset: Offset(0.0, 10.0),
                                            blurRadius: 10.0)
                                      ],
                                      borderRadius:
                                          BorderRadius.circular(12.0)),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    images[index],
                                    width: 162.5,
                                    height: 179.0,
                                  ),
                                  SizedBox(height: 12.0),
                                  Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          title[index],
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                              color: (index % 2 == 0)
                                                  ? Color(0xFF2a2d3f)
                                                  : Colors.white),
                                        ),
                                        SizedBox(height: 8.0),
                                        Text(
                                          "new sell",
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold,
                                              color: (index % 2 == 0)
                                                  ? Color(0xFF2a2d3f)
                                                  : Colors.white),
                                        ),
                                        SizedBox(height: 10.0),
                                        Text(
                                          price[index] + " \$",
                                          style: TextStyle(
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold,
                                              color: (index % 2 == 0)
                                                  ? Color(0xFF2a2d3f)
                                                  : Colors.white),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.panorama_horizontal),
                title: Container(
                  height: 0.0,
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_border),
                title: Container(
                  height: 0.0,
                )),
          ]),
      floatingActionButton: Container(
        width: 55.0,
        height: 55.0,
        decoration: BoxDecoration(
            color: Color(0xFFfa7b58),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Color(0xFFf78a6c).withOpacity(.6),
                  offset: Offset(0.0, 10.0),
                  blurRadius: 10.0)
            ]),
        child: RawMaterialButton(
          shape: CircleBorder(),
          child: Icon(
            Icons.add,
            size: 35.0,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
