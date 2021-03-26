import 'package:flutter/material.dart';
import 'package:flutter_portal_imobiliario/pages/Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'sem nome ainda',
      home: Login(),
    );
  }
}
