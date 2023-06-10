import 'package:alt_access/styling/constants.dart';
import 'package:alt_access/ui/login/login.dart';
import 'package:alt_access/ui/widgets/rectangular_button.dart';
import 'package:alt_access/ui/widgets/rectangular_input_field.dart';
import 'package:flutter/material.dart';

class Credentials extends StatelessWidget {
  const Credentials({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Constants.appPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RectangularInputField(
            hintText: 'Old Password',
            icon: Icons.lock,
            obscureText: false,
          ),
          SizedBox(
            height: Constants.appPadding / 2,
          ),
          const RectangularInputField(
            hintText: 'New Password',
            icon: Icons.lock,
            obscureText: true,
          ),
          SizedBox(
            height: Constants.appPadding / 2,
          ),
          const RectangularInputField(
            hintText: 'Confirm New Password',
            icon: Icons.lock,
            obscureText: true,
          ),
          SizedBox(
            height: Constants.appPadding / 2,
          ),
          RectangularButton(
              text: 'Change',
              press: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              })
        ],
      ),
    );
  }
}
