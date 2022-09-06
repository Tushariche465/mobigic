import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobigic/src/homescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 4),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        height: MediaQuery.of(context).size.height*0.15,
        width: MediaQuery.of(context).size.width*0.9,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Icon.png'),
            fit: BoxFit.fill
          )
        ),
        child: Text('Mobigic Technologies'),

      )
    )
    );
  }
}
