import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'dart:math' as math;

import 'package:flutter_portal_imobiliario/database/database.dart';
import 'package:flutter_portal_imobiliario/models/building.dart';
import 'package:flutter_portal_imobiliario/widgets/Description.dart';
import 'package:flutter_portal_imobiliario/widgets/TopBar.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  final List<Building> items = [];
  PageController _controller;
  double scrollOfset = 0.0;
  int initialIndex = 0;
  bool condition = false;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0, viewportFraction: .8);
    _controller.addListener(() {
      setState(() => scrollOfset = _controller.page);
    });

    getSimulate();

    Timer(Duration(seconds: 2), () {
      setState(() {
        condition = true;
      });
    });
  }

  void getSimulate() {
    // ignore: prefer_is_not_empty
    if (!items.isEmpty) {
      return;
    } else {
      for (int i = 0; i < DataBase.building.length; i++) {
        items.add(
          Building(
            DataBase.building.keys.elementAt(i),
            DataBase.building.values.elementAt(i),
            math.Random().nextDouble() * (2500 - 800) + 800,
            math.Random().nextInt(6),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Stack(
        children: <Widget>[
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * .8,
              height: MediaQuery.of(context).size.height * .85,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(200),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.greenAccent, Colors.white70],
                  stops: [.33, 1],
                ),
              ),
            ),
          ),
          PageView.builder(
            controller: _controller,
            itemCount: items.length,
            onPageChanged: (index) {
              setState(() {
                initialIndex = index;
              });
            },
            itemBuilder: (context, index) {
              double aligment =
                  math.exp(-math.pow(scrollOfset - index, -4) / items.length);
              return condition
                  ? Align(
                      alignment: Alignment(0, aligment),
                      child: Transform.rotate(
                        angle: -(aligment * .5),
                        child: Container(
                          width: 200 - aligment * 5,
                          height: 200 - aligment * 5,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                              image: NetworkImage(items[index].image),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child:
                          Loading(indicator: BallPulseIndicator(), size: 100.0),
                    );
            },
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .63),
              child: Description(
                items: items[initialIndex],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .87,
            left: MediaQuery.of(context).size.width * .40,
            child: Container(
              width: 80,
              height: 80,
              decoration:
                  BoxDecoration(color: Colors.blueGrey, shape: BoxShape.circle),
              child: Icon(
                Icons.house,
                color: Colors.white,
              ),
            ),
          ),
          TopBar()
        ],
      ),
    );
  }
}
