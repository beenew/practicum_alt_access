import 'dart:io';
// import 'package:flutter/foundation.dart';
import 'package:alt_access/ui/admin_home/admin_home.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
//import 'package:qr_flutter/qr_flutter.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:alt_access/styling/constants.dart';
import 'package:alt_access/ui/signup/components/credentials.dart';
import 'package:alt_access/ui/login/login.dart';
import 'package:alt_access/ui/widgets/account_check.dart';
import 'package:flutter/material.dart';

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  _QRViewExampleState createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  MobileScannerController cameraController = MobileScannerController();
  String Barcode="Qr Generator";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(context),

          title: Text(
            Barcode,
            style: TextStyle(color: Constants.Black),
          ),
          backgroundColor: Constants.darkShadow,
          elevation: 0.0,
          actions: [
            IconButton(
              color: Colors.white,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.torchState,
                builder: (context, state, child) {
                  switch (state as TorchState) {
                    case TorchState.off:
                      return const Icon(Icons.flash_off, color: Colors.grey);
                    case TorchState.on:
                      return const Icon(Icons.flash_on, color: Colors.yellow);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => cameraController.toggleTorch(),
            ),
            IconButton(
              color: Colors.white,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.cameraFacingState,
                builder: (context, state, child) {
                  switch (state as CameraFacing) {
                    case CameraFacing.front:
                      return const Icon(Icons.camera_front);
                    case CameraFacing.back:
                      return const Icon(Icons.camera_rear);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => cameraController.switchCamera(),
            ),
          ],
        ),
        body: MobileScanner(
            allowDuplicates: false,
            controller: cameraController,
            onDetect: (barcode, args) {
              if (barcode.rawValue == null) {
                debugPrint('Failed to scan Barcode');
              } else {
                final String code = barcode.rawValue!;
                debugPrint('Barcode found! $code');
                Barcode='$code';
                setState(() {

                });
                //Navigator.pop(context);
               // cameraController?.dispose();

              }
            }));
  }

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
  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }
}
