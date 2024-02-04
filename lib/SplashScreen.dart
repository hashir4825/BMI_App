import 'dart:async';

import 'package:bmi_app/main.dart';
import 'package:flutter/material.dart';

class Splash_screen extends StatefulWidget {
  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(
              title: "BMI App",
            ),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.purple,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Container(
                  height: 500, // Set a height for the container
                  width: double.infinity,
                  decoration: BoxDecoration(
                    // color: Colors.orange,
                    image: DecorationImage(
                      image: AssetImage("assets/images/bmi.jpg"),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Container(
                  height: 500, // Set a height for the container
                  width: double.infinity,
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    image: DecorationImage(
                      image: AssetImage("assets/images/bmi2.jpg"),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Container(
                  height: 500, // Set a height for the container
                  width: double.infinity,
                  decoration: BoxDecoration(
                    // color: Colors.cyan,
                    image: DecorationImage(
                      image: AssetImage("assets/images/bmi3.jpg"),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
