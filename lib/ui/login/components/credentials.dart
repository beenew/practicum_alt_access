import 'package:alt_access/styling/constants.dart';
import 'package:alt_access/ui/forget_password/forget_password.dart';
import 'package:alt_access/ui/user_home/user_home.dart';
import 'package:alt_access/ui/widgets/rectangular_button.dart';
import 'package:alt_access/ui/widgets/rectangular_input_field.dart';
import 'package:flutter/material.dart';
import 'package:alt_access/ui/admin_home/admin_home.dart';


class Credentials extends StatelessWidget {
  const Credentials({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailcontroller = TextEditingController();
    return Padding(
      padding: EdgeInsets.all(Constants.appPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           RectangularInputField(
            controller: emailcontroller,
            hintText: 'Email',
            icon: Icons.email_rounded,
            obscureText: false,
          ),
          SizedBox(
            height: Constants.appPadding / 2,
          ),
          const RectangularInputField(
            hintText: 'Password',
            icon: Icons.lock,
            obscureText: true,
          ),
          SizedBox(
            height: Constants.appPadding / 2,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ForgetPassword()));
              },
              child:  Text(
                'Forget Password?',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  color:  Constants.lightPrimary,
                ),
              ),
            ),
          ),
          RectangularButton(text: 'Sign In',
           press: () {
            if(emailcontroller.value.text.contains("admin"))
              {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const AdminHome()));
              }
            else if(emailcontroller.value.text.contains("user") || emailcontroller.value.text.contains("agent"))
              {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const UserHome()));
              }


            },)
        ],
      ),
    );
  }
}
