import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Register extends StatefulWidget {
  String name;
  String email;
  String password;
  final VoidCallback onRegister;
  final VoidCallback onReturnLogin;

  Register(
      {@required this.name,
      @required this.email,
      @required this.password,
      @required this.onRegister,
      @required this.onReturnLogin});

  @override
  _Register createState() => _Register();
}

class _Register extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Formulário de cadastro',
          style: TextStyle(
              color: Colors.greenAccent,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        Center(
          child: Column(
            children: <Widget>[
              Form(
                key: this._formKey,
                child: Padding(
                  padding: EdgeInsets.all(32.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Nome',
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(),
                          ),
                        ),

                        // ignore: deprecated_member_use
                        autovalidate: false,
                        onSaved: (value) => widget.email = value,
                        // ignore: missing_return
                        validator: (value) {
                          if (value.length < 3) {
                            return 'a minimum of 3 characters is required';
                          }
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Email',
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(),
                          ),
                        ),

                        // ignore: deprecated_member_use
                        autovalidate: false,
                        onSaved: (value) => widget.email = value,
                        // ignore: missing_return
                        validator: (value) {
                          if (value.length < 3) {
                            return 'a minimum of 3 characters is required';
                          }
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Password',
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(),
                          ),
                        ),

                        // ignore: deprecated_member_use
                        autovalidate: false,
                        onSaved: (value) => widget.password = value,
                        // ignore: missing_return
                        validator: (value) {
                          if (value.length < 3) {
                            return 'a minimum of 8 characters is required';
                          }
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 50.0,
          margin: EdgeInsets.all(10),
          // ignore: deprecated_member_use
          child: RaisedButton(
            onPressed: () => widget.onRegister(),
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
                  "Cadastrar",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 50.0,
          margin: EdgeInsets.all(0),
          // ignore: deprecated_member_use
          child: RaisedButton(
            onPressed: () => widget.onReturnLogin(),
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
                  "Voltar ao login",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
