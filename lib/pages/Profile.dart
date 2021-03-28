import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_portal_imobiliario/database/database.dart';
import "package:latlong/latlong.dart";

class Profile extends StatefulWidget {
  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();

    Timer(Duration(milliseconds: 500), () {
      setState(() {
        opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Casa no grageru'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Opacity(
                opacity: opacity,
                child: Container(
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Casa no Grageru",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey),
                      ),
                      TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0.0, end: 1500.00),
                        duration: Duration(seconds: 2),
                        builder: (context, price, child) {
                          return Text(
                            "R\$ " + '${price.toStringAsFixed(2)}',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    fontSize: 32, fontWeight: FontWeight.w900),
                          );
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          for (var item in DataBase.multImages)
                            Opacity(
                              opacity: opacity,
                              child: Container(
                                child: Image.network(
                                  item,
                                  height: 100,
                                  width: 90,
                                ),
                              ),
                            ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (index) {
                            bool selected = index <= 3;
                            return Icon(
                              Icons.star,
                              color: selected ? Colors.yellow : Colors.grey,
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Opacity(
            opacity: opacity,
            child: Container(
              height: 140,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/logo.jpeg',
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Container(
                          child: Text('Meu Cafofo',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                              'Sem custos fixos e com a acesso a suporte 24 horas por dia. Assistência 24/7. Sem taxas de cadastro. Propaganda grátis. Sem custos fixos.'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Text(
            'Localização',
            style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(-10.8851535, -37.0747029),
                zoom: 16.0,
              ),
              layers: [
                TileLayerOptions(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c']),
                MarkerLayerOptions(
                  markers: [
                    Marker(
                      width: 120.0,
                      height: 120.0,
                      point: LatLng(-10.8851535, -37.0747029),
                      builder: (ctx) => Container(
                        child: Icon(
                          Icons.home,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
