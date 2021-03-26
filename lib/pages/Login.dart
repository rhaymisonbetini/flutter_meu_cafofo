import 'package:flutter/material.dart';
import 'package:flutter_portal_imobiliario/widgets/Register.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';

import 'package:flutter_portal_imobiliario/widgets/Logar.dart';
import 'package:flutter_portal_imobiliario/widgets/initial.dart';

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

  bool isLogin = false;
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

  _sendLogin() {}

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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/logo.jpeg',
                          height: 180,
                          fit: BoxFit.fill,
                        ),
                      )
                    ],
                  ),
                )
              : Container(),
          !isLogin && !isRegister
              ? Initial(
                  title: title,
                  subTitle: subTitle,
                  onChangeState: () {
                    _isLogin();
                  },
                  onChangeRegister: () {
                    _isRegiste();
                  },
                )
              : isLogin && !isRegister
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
                    )
        ],
      ),
    );
  }
}
