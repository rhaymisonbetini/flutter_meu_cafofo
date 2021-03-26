import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Initial extends StatefulWidget {
  final title;
  final subTitle;
  final VoidCallback onChangeState;
  final VoidCallback onChangeRegister;

  Initial(
      {@required this.title,
      @required this.subTitle,
      @required this.onChangeState,
      @required this.onChangeRegister});

  @override
  _Initial createState() => _Initial();
}

class _Initial extends State<Initial> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: Center(
            child: Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: Center(
            child: Text(
              widget.subTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Container(
          height: 50.0,
          margin: EdgeInsets.all(0),
          // ignore: deprecated_member_use
          child: RaisedButton(
            onPressed: () => widget.onChangeState(),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0)),
            padding: EdgeInsets.all(0.0),
            child: Ink(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green, Colors.greenAccent],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(30.0)),
              child: Container(
                constraints: BoxConstraints(maxWidth: 340.0, minHeight: 50.0),
                alignment: Alignment.center,
                child: Text(
                  "Login",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 50.0,
          margin: EdgeInsets.all(10),
          // ignore: deprecated_member_use
          child: RaisedButton(
            onPressed: () => widget.onChangeRegister(),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0)),
            padding: EdgeInsets.all(0.0),
            child: Ink(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xffBA9BA0), Color(0xffBA9BA0)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(30.0)),
              child: Container(
                constraints: BoxConstraints(maxWidth: 340.0, minHeight: 50.0),
                alignment: Alignment.center,
                child: Text(
                  "Cadastro",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
