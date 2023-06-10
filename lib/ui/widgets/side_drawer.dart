import 'package:alt_access/ui/admin_home/Functions/file_directory.dart';
import 'package:alt_access/ui/admin_home/Functions/qr_creator.dart';
import 'package:alt_access/ui/admin_home/admin_home.dart';
import 'package:alt_access/ui/qr_scanner/qr_scanner.dart';
import 'package:flutter/material.dart';
import 'package:alt_access/styling/constants.dart';
import '';
import '../admin_home/Functions/document_upload.dart';
import '../login/login.dart';

class SideDrawer extends StatefulWidget {
  final bool login;
  final VoidCallback press;

  const SideDrawer({Key? key, required this.login, required this.press})
      : super(key: key);

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  Image image1=Image.asset("assets/sidebarheader.jpg");
  @override
  void initState() {
    super.initState();
    image1 = Image.asset("assets/sidebarheader.jpg");
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    precacheImage(image1.image, context);

  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(80), bottomRight: Radius.circular(80)),
      ),
      width: MediaQuery.of(context).size.width * 0.70,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("Alt Access.co"),
            accountEmail: const Text("admin@altaccess.co"),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://randomuser.me/api/portraits/women/74.jpg"),
            ),
            decoration: BoxDecoration(
              color: Constants.lightPrimary,
              image:  DecorationImage(
                image: image1.image,
                fit: BoxFit.fill,
              ),
            ),
            // otherAccountsPictures: const [
            //   CircleAvatar(
            //     backgroundColor: Colors.white,
            //   ),

            // ],
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Constants.Gold,
              size: 30.0,
            ),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const AdminHome()));

            },
          ),
          ListTile(
            leading: Icon(
              Icons.file_upload,
              color: Constants.Gold,
              size: 30.0,
            ),
            title: const Text('Upload New File'),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const DocumentUpload()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.qr_code,
              color: Constants.Gold,
              size: 30.0,
            ),
            title: const Text('Create Qr Code For Lock'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const QrCreator()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings_suggest,
              color: Constants.Gold,
              size: 30.0,
            ),
            title: const Text('Scan Qr Code'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) =>  QRViewExample()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.file_copy,
              color: Constants.Gold,
              size: 25.0,
            ),
            title: const Text('File Directory'),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const FileDirectory()));
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.35),
          const Divider(
            thickness: 2,
            color: Colors.black54,
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: Colors.black54,
              size: 30.0,
            ),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Login()));
            },
          ),
        ],
      ),
    );
  }
}
