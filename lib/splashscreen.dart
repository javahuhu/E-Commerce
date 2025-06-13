
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    context.go('/homescreen');
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