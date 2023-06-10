import 'dart:async';
import 'package:alt_access/styling/constants.dart';
import 'package:alt_access/ui/admin_home/admin_home.dart';
import 'package:alt_access/ui/login/login.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../widgets/rectangular_button.dart';
import '../../widgets/rectangular_input_field.dart';
import '../../widgets/side_drawer.dart';

class FileDirectory extends StatefulWidget {
  const FileDirectory({Key? key, this.maxValue = "0", this.minValue = "0", this.fileName = "Filename"}) : super(key: key);
  final String? maxValue;
  final String? minValue;
  final String? fileName;

  @override
  FileDirectoryState createState() => FileDirectoryState();
}

class FileDirectoryState extends State<FileDirectory>
    with TickerProviderStateMixin {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "File Directory",
          style: TextStyle(color: Constants.Black),
        ),
        backgroundColor: Constants.lightPrimary,
        elevation: 5,
        // scrolledUnderElevation: scrolledUnderElevation,
        //shadowColor: true ? Theme.of(context).colorScheme.shadow : null,
      ),
      drawer: SideDrawer(
          login: true,
          press: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const AdminHome()));
          }),
      backgroundColor: Constants.lightPrimary,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children:  [
            buildTextField(context),
            Row(
              children: [
               Text("Min agents required to unlock: ",style: TextStyle(color: Colors.black,fontSize: 14),),
                Text("${this.widget.minValue} ",style: TextStyle(color: Colors.red,fontSize: 14),),
              ],
            ),
            Row(
              children: [
                Text("Max shares created : ",style: TextStyle(color: Colors.black,fontSize: 14),),
                Text("${this.widget.maxValue} ",style: TextStyle(color: Colors.red,fontSize: 14),),

              ],
            ),

          ],
        ),
      ),
    );
  }

  Widget buildTextField(BuildContext context) => TextField(
    controller: controller,
    style: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    readOnly: true,
    decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white30,
        hintText: this.widget.fileName,
        hintStyle: const TextStyle(color: Colors.black54),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.black54,
          ),
        ),

        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white30)),
        contentPadding: EdgeInsets.all(20.0),
       ),
  );


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }
}
