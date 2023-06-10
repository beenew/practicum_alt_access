import 'package:alt_access/styling/constants.dart';
import 'package:alt_access/ui/forget_password/components/credentials.dart';
import 'package:flutter/material.dart';
import 'components/head_text.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     colors: [
        //       Constants.lightPrimary,
        //       Constants.darkPrimary,
        //     ]),
          image: const DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.fill,
          )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Constants.appPadding / 0.4,
              ),
              const HeadText(),
              const Credentials(),
            ],
          ),
        ),
      ),
    );
  }
}
