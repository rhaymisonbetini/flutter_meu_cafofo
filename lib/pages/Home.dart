import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_portal_imobiliario/database/database.dart';
import 'package:flutter_portal_imobiliario/models/building.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  final List<Building> items = [];
  PageController _controller;
  double scrollOfset = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0, viewportFraction: .8);
    _controller.addListener(() {
      setState(() => scrollOfset = _controller.page);
    });

    getSimulate();
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
            math.Random().nextInt(15000),
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
                  colors: [Colors.greenAccent, Colors.white],
                  stops: [.33, 1],
                ),
              ),
            ),
          ),
          PageView.builder(
            controller: _controller,
            itemCount: items.length,
            itemBuilder: (context, index) {
              double aligment =
                  math.exp(-math.pow(scrollOfset - index, -4) / items.length);

              final item = items.elementAt(index);

              return Align(
                alignment: Alignment(0, aligment),
                child: Transform.rotate(
                  angle: -(aligment * .5),
                  child: Container(
                    width: 180 - aligment * 5,
                    height: 180 - aligment * 5,
                    margin: EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(item.image),
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
