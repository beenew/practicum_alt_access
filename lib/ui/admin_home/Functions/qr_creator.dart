import 'dart:async';
import 'package:alt_access/styling/constants.dart';
import 'package:alt_access/ui/admin_home/admin_home.dart';
import 'package:alt_access/ui/login/login.dart';
import 'package:alt_access/ui/widgets/rectangular_button.dart';
import 'package:alt_access/ui/widgets/rectangular_input_field.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';


class QrCreator extends StatefulWidget {
  const QrCreator({Key? key}) : super(key: key);

  @override
  QrCreatorState createState() => QrCreatorState();
}

class QrCreatorState extends State<QrCreator> {
  var controller = TextEditingController();
  var maxcontroller = TextEditingController();
  final mincontroller = TextEditingController();

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
           leading: BackButton(context),
          // {
          //
          // },
          title: Text(
            "Qr Generator",
            style: TextStyle(color: Constants.Black),
          ),
          backgroundColor: Constants.darkShadow,
          elevation: 0.0,
          // scrolledUnderElevation: scrolledUnderElevation,
          //shadowColor: true ? Theme.of(context).colorScheme.shadow : null,
        ),
        backgroundColor: Constants.darkShadow,
        body: Center(
          child: SingleChildScrollView(
            padding: const  EdgeInsets.all(25),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                QrImage(
                  data: controller.text,
                  size: 200,
                  backgroundColor: Constants.lightShadow,
                ),
                const SizedBox(height: 40),
                 RectangularInputField(
                  controller: controller,
                  hintText: 'Enter Lock Password',
                  //keyboardType: TextInputType.numberWithOptions(),
                  icon: Icons.lock,
                  obscureText: true,
                ),
                RectangularInputField(
                  controller: maxcontroller,
                  hintText: 'Maximum Password Shares to be generated',
                  keyboardType: TextInputType.numberWithOptions(),
                  icon: Icons.home_max,
                  obscureText: false,
                ),
                RectangularInputField(
                  controller: mincontroller,
                  hintText: 'Minimum Share Required',
                  keyboardType: TextInputType.numberWithOptions(),
                  icon: Icons.home_mini,
                  obscureText: false,
                ),

                // RectangularButton(text: 'Generate QR',
                //   press: () => {
                //     setState(() {
                //
                //     }),
                //
                //
                //
                //   },),
                MaterialButton(
                  onPressed: () {

                    if(maxcontroller.value.text.length > 1)
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Max value cannot be greater than 9')),
                      );
                    }
                    else if(int.parse(mincontroller.value.text) > int.parse(maxcontroller.value.text))
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Min value cannot be greater than max value')),
                      );
                    }
                    else if(mincontroller.value.text.length > 1)
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Min value cannot be greater than 9')),
                      );
                    }

                    else
                    {
                    setState(() {

                    });
                    }

                  },
                  height: 40.0,
                  minWidth: 100.0,
                  color: Constants.background,
                  textColor: Colors.black54,
                  splashColor: Colors.redAccent,
                  child: const Text("Generate Secret QR code to share"),
                ),


               // buildTextField(context,"Enter Lock Password",const Icon(Icons.done, size: 30,)),
               // buildTextField(context,"Max Number of agents",const Icon(Icons.man, size: 30,)),
                //buildTextField(context,"Min Required To unlock",const Icon(Icons.home_mini, size: 30,)),


              ],
            ),
          ),
        ),
      );

  @override
  Widget BackButton(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    return IconButton(
      icon: const BackButtonIcon(),
      color: Colors.white60,
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      onPressed: () =>{Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => const AdminHome())),
    }
    );
  }

  Widget buildTextField(BuildContext context,String text,Icon Icon1) =>
      TextField(
        controller: controller,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,

        ),
        decoration: InputDecoration(
            hintText: text,
            hintStyle: const TextStyle(color: Colors.white60),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white,
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Constants.lightShadow)
            ),
            suffixIcon: IconButton(
              color: Constants.lightShadow,
              icon: Icon1,
              onPressed: () =>
                  setState(() {

                  }),
            )

        ),
      );


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
