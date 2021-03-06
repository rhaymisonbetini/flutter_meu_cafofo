import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_portal_imobiliario/pages/Home.dart';
import 'package:flutter_portal_imobiliario/widgets/Register.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';

import 'package:flutter_portal_imobiliario/widgets/Logar.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  VideoPlayerController _controller;
  String title = '';
  String subTitle = '';
  Timer timer;
  int countDown = 0;
  int reload = 5;

  List<String> titleArray = ['Apartamentos', 'Casas', 'Conforto'];
  List<String> subTitleArray = [
    'Apartamenos incriveis para você alugar',
    'Casas com ou sem gararem para sua comodidade',
    'Tudo que você procura na palma da sua mão'
  ];

  bool isLogin = true;
  bool isRegister = false;

  String email;
  String password;
  String name;

  _isLogin() {
    setState(
      () {
        isLogin = true;
        isRegister = false;
      },
    );
  }

  _isRegiste() {
    setState(
      () {
        isLogin = false;
        isRegister = true;
      },
    );
  }

  _sendLogin() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/town.mp4')
      ..initialize().then((_) {
        setState(() {});
      });

    _controller.play();
    _controller.setLooping(true);
    _controller.setVolume(0.0);
    Timer.periodic(Duration(seconds: reload), (Timer timer) {
      setState(() {
        title = titleArray[countDown];
        subTitle = subTitleArray[countDown];
        countDown == 2 ? countDown = 0 : countDown++;
      });
    });

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Container(),
          ),
          !isRegister
              ? Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 150.0,
                      ),
                      ClipOval(
                        child: Image.asset(
                          'assets/logo.jpeg',
                          height: 180,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Center(
                          child: Text(
                            title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xffBA9BA0),
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Center(
                          child: Text(
                            subTitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.greenAccent,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
          isLogin && !isRegister
              ? Logar(
                  email: email,
                  password: password,
                  onLogin: () {
                    _sendLogin();
                  },
                  onChangeRegister: () {
                    _isRegiste();
                  },
                )
              : Register(
                  name: name,
                  email: email,
                  password: password,
                  onRegister: () {},
                  onReturnLogin: () {
                    _isLogin();
                  },
                ),
        ],
      ),
    );
  }
}
