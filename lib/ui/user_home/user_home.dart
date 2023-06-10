import 'dart:async';
import 'package:alt_access/styling/constants.dart';
import 'package:alt_access/ui/login/login.dart';
import 'package:flutter/material.dart';
import 'package:alt_access/ui/forget_password/forget_password.dart';
import 'package:alt_access/ui/widgets/rectangular_button.dart';
import 'package:alt_access/ui/widgets/rectangular_input_field.dart';

import '../widgets/side_drawer.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  UserHomeState createState() => UserHomeState();
}

class UserHomeState extends State<UserHome> {
  @override
  void initState() {
    super.initState();
  }

  Widget _widget() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hello Admin",
          style: TextStyle(color: Constants.Black),
        ),
        backgroundColor: Constants.lightPrimary,
        elevation: 0.0,
        // scrolledUnderElevation: scrolledUnderElevation,
        //shadowColor: true ? Theme.of(context).colorScheme.shadow : null,
      ),
      drawer: SideDrawer( login: false,
          press:(){Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Login()));
          }
      ),


      body: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Constants.lightPrimary,
                  Constants.buttoncolour,
                ]),
            // image: const DecorationImage(
            //   image: AssetImage('assets/background.jpg'),
            //   fit: BoxFit.fill,
            // ),
          ),
          child: Center(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
            ),
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
    //controller.dispose();
    super.dispose();
  }
}
