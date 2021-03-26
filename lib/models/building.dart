import 'package:flutter/cupertino.dart';

class Building {
  @required
  String name;
  @required
  String image;
  @required
  int valor;
  @required
  int stars;
  Building(this.name, this.image, this.valor, this.stars);
}
