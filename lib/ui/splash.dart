import 'dart:async';
import 'package:alt_access/styling/constants.dart';
import 'package:alt_access/ui/login/login.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    startTime();
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = Tween<double>(begin: 0, end: 500).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
    controller.forward();
  }

  startTime() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Login()));
  }

  Widget _widget() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Constants.Black,
                  Constants.Black,
                ]),
            // image: const DecorationImage(
            //   image: AssetImage('assets/background.jpg'),
            //   fit: BoxFit.fill,
            // ),
          ),
          child: Center(
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Image.asset(
                  'assets/logo.png',
                  width: 500,
                  height: 500,
                )),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final md = MediaQuery.of(context);
    if (md.orientation == Orientation.landscape) {
      return _widget();
    }
    return _widget();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
