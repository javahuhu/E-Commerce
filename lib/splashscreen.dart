
import 'package:flutter/material.dart';
import 'homescreen.dart';
import 'dart:async';
class SplashScreen extends StatefulWidget {
  const SplashScreen ({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

 @override
 void initState() {
  super.initState();
  
  Timer(const Duration(seconds: 3), () {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
  });
  
 }
    @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/splashscreenlaza.png',), fit: BoxFit.cover)
        ),
      )
    );

  } 
}