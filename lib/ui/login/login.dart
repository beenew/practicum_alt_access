import 'package:alt_access/styling/constants.dart';
import 'package:alt_access/ui/login/components/credentials.dart';
import 'package:alt_access/ui/signup/signup.dart';
import 'package:alt_access/ui/widgets/account_check.dart';
import 'package:flutter/material.dart';
import 'components/head_text.dart';
import 'package:alt_access/ui/admin_home/admin_home.dart';



  class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
  }

  // class LoginState extends State<Login> {
  // @override
  // void initState() {
  // super.initState();
  // }


class _LoginState extends State<Login> {
   Image image1=Image.asset("assets/background.jpg");
   @override
   void initState() {
   super.initState();
    image1 = Image.asset("assets/background.jpg");
   }
   @override
   void didChangeDependencies() {
     super.didChangeDependencies();

     precacheImage(image1.image, context);

   }

  @override
  Widget build(BuildContext context) {
    var maxcontroller = TextEditingController();
    return Container(

      decoration:  BoxDecoration(

          image: DecorationImage(
            image: image1.image,
            fit: BoxFit.fill,
          )
    ),
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
              // Social(),
              AccountCheck(
                login: true,
                press: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Signup()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
