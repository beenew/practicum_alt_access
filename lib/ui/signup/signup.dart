import 'package:alt_access/styling/constants.dart';
import 'package:alt_access/ui/signup/components/credentials.dart';
import 'package:alt_access/ui/login/login.dart';
import 'package:alt_access/ui/widgets/account_check.dart';
import 'package:flutter/material.dart';
import '../qr_scanner/qr_scanner.dart';
import 'components/head_text.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
             image:  DecorationImage(
            image:   AssetImage('assets/background.jpg'),
            fit: BoxFit.fill,
          )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeadText(),
              const Credentials(),
              AccountCheck(
                login: false,
                press: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Login()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
