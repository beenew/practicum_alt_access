import 'dart:async';
import 'package:alt_access/styling/constants.dart';
import 'package:alt_access/ui/admin_home/Functions/file_directory.dart';
import 'package:alt_access/ui/admin_home/admin_home.dart';
import 'package:alt_access/ui/login/login.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../widgets/rectangular_button.dart';
import '../../widgets/rectangular_input_field.dart';
import '../../widgets/side_drawer.dart';

class DocumentUpload extends StatefulWidget {
  const DocumentUpload({Key? key}) : super(key: key);

  @override
  DocumentUploadState createState() => DocumentUploadState();
}

class DocumentUploadState extends State<DocumentUpload>
    with TickerProviderStateMixin {
  final controller = TextEditingController();
  final passcontroller = TextEditingController();
  final maxcontroller = TextEditingController();
  final mincontroller = TextEditingController();
  Image image1=Image.asset("assets/Home back.jpg");
  @override
  void initState() {
    super.initState();
    image1 = Image.asset("assets/Home back.jpg");
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    precacheImage(image1.image, context);

  }

  var fileName = "Select File to Upload";

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 1, vsync: this);
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Upload Document",
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
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                buildTextField(context),
                const SizedBox(height: 20),
              ],
            ),
            // Container(
            //   child: buildTextField(context),
            // ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Constants.darkPrimary.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.orange.withOpacity(0.9)),
                  controller: tabController,
                  isScrollable: true,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 20),
                  tabs: const [
                    // Tab(
                    //   child: Text("Keep it as Public \n Document"),
                    // ),
                    Tab(
                      child: Text(
                        " Keep it as Locked Document",
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: TabBarView(
              controller: tabController,
              children: [
                // Center(
                //   child: MaterialButton(
                //     onPressed: () => null,
                //     height: 40.0,
                //     minWidth: 70.0,
                //     color: Constants.background,
                //     textColor: Colors.black54,
                //     splashColor: Colors.redAccent,
                //     child: const Text("Upload File and make it Public"),
                //   ),
                // ),
                Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                       RectangularInputField(
                        controller: passcontroller,
                        hintText: 'Create a Lock',
                        icon: Icons.password,
                        obscureText: true,
                      ),
                       RectangularInputField(
                        controller: maxcontroller,
                        keyboardType: const TextInputType.numberWithOptions(),
                        hintText: 'Maximum Number of Agents for this Document',
                        icon: Icons.home_max,
                        obscureText: false,

                      ),
                       RectangularInputField(
                        controller: mincontroller,
                        keyboardType: const TextInputType.numberWithOptions(),
                        hintText: 'Minimum number of Agents Required',
                        icon: Icons.home_mini,
                        obscureText: false,
                      ),
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
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) =>  FileDirectory(maxValue: maxcontroller.value.text,minValue: mincontroller.value.text,fileName: fileName,)));
                            }

                        },
                        height: 40.0,
                        minWidth: 70.0,
                        color: Constants.background,
                        textColor: Colors.black54.withOpacity(0.9),
                        splashColor: Colors.redAccent,
                        child: const Text("Upload File with Lock"),
                      ),
                    ],
                  ),
                ),
              ],
            ))
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
            hintText: fileName,
            hintStyle: const TextStyle(color: Colors.black54),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.black54,
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Constants.darkPrimary)),
            contentPadding: const EdgeInsets.all(20.0),
            suffixIcon: IconButton(
              padding: const EdgeInsetsDirectional.only(end: 12.0),
              color: Constants.Black,
              icon: const Icon(
                Icons.upload_file_outlined,
                size: 30,
              ),
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles();
                if (result == null) return;

                //open single file
                final file = result.files.first;
                fileName = file.name!;
                setState(() {});
                // openFile(file);
              },
            )),
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
