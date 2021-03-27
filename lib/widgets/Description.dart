import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_portal_imobiliario/models/building.dart';

class Description extends StatefulWidget {
  final Building items;

  Description({@required this.items});

  @override
  _Description createState() => _Description();
}

class _Description extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          widget.items.name,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              bool selected = index <= widget.items.stars;
              return Icon(
                Icons.star,
                color: selected ? Colors.blueGrey : Colors.white70,
              );
            }),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0.0, end: widget.items.valor),
          duration: Duration(milliseconds: 500),
          builder: (context, price, child) {
            return Text(
              "R\$ " + '${price.toStringAsFixed(2)}',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontSize: 32, fontWeight: FontWeight.w900),
            );
          },
        )
      ],
    );
  }
}
