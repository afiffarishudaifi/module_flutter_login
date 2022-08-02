import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_login/screens/login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  navigateToMain(BuildContext context) async {
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login())));
  }

  @override
  Widget build(BuildContext context) {
    navigateToMain(context);
    return Scaffold(
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 110,
            height: 110,
            child: Image(
              image: NetworkImage(
                  "https://ruangumkm.ilmanaf.com/public/img/default/launcher.png"),
            ),
          ),
        ),
      ),
    );
  }
}
