import 'package:alt_access/styling/constants.dart';
import 'package:flutter/material.dart';

class HeadText extends StatelessWidget {
  const HeadText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Constants.appPadding,
        vertical: Constants.appPadding / 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.05),
           Text(
            '',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color:  Constants.lightPrimary,
            ),
          ),
           Text(
            'FORGET PASSWORD',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color:  Constants.lightPrimary,
              decoration:
              TextDecoration.underline,
              decorationColor: Constants.percenttext,
              decorationThickness: 4,

            ),
          ),
        ],
      ),
    );
  }
}
