import 'dart:async';
import 'package:alt_access/styling/constants.dart';
import 'package:alt_access/ui/login/login.dart';
import 'package:flutter/material.dart';
import 'package:alt_access/ui/forget_password/forget_password.dart';
import 'package:alt_access/ui/widgets/rectangular_button.dart';
import 'package:alt_access/ui/widgets/rectangular_input_field.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../widgets/side_drawer.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  AdminHomeState createState() => AdminHomeState();
}

class AdminHomeState extends State<AdminHome> {
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

  Widget _widget() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(

      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          "Hello Admin",
          style: TextStyle(color: Colors.white),
        ),

        backgroundColor: Colors.transparent,
        elevation: 0.0,
        // scrolledUnderElevation: scrolledUnderElevation,
        //shadowColor: true ? Theme.of(context).colorScheme.shadow : null,
      ),
      drawer: SideDrawer( login: true,
        press:(){Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const AdminHome()));
      }
      ),


      body: Container(
          width: width,
          height: height,


        decoration:  BoxDecoration(
          image: DecorationImage(
            image: image1.image,
            fit: BoxFit.fill,
          ),
            //  gradient: LinearGradient(
            //     begin: Alignment.topCenter,
            //     end: Alignment.bottomCenter,
            //     colors: [
            //       Color(0x8080D3FF),
            //       Color(0xB78BA9AF),
            //     ],
            //
            // ),
          ),


        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: StaggeredGrid.count(
            crossAxisCount: 4,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 25.0,
            children: <Widget>[


              StaggeredGridTile.count(

                crossAxisCellCount: 4,
                mainAxisCellCount: 2,
                child: Title("Welcome To Alt Access","Redefining Access Control"),

              ),

              StaggeredGridTile.count(

                crossAxisCellCount: 2,
                mainAxisCellCount: 2,
                child: myTextItems("Total Agents","20"),

              ),
              StaggeredGridTile.count(

                crossAxisCellCount: 2,
                mainAxisCellCount: 2,
                child: myTextItems("Total Locks","10"),

              ),
              StaggeredGridTile.count(

                crossAxisCellCount: 4,
                mainAxisCellCount: 2,
                child: myTextItems("Number of QR Generated","10"),

              ),
            ],
          ),
        ),
      ),
    );
  }

  Material myTextItems(String title, String subtitle,){
    return Material(
      color: Colors.white54,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child:Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child:Text(title,style:TextStyle(
                      fontSize: 20.0,
                      color: Colors.black54,
                    ),),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                    Icons.settings_suggest,
                    color: Constants.Gold,
                    size: 30.0,
                  ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child:Text(subtitle,style:TextStyle(
                      fontSize: 30.0,
                    ),),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  Material Title(String title, String subtitle){
    return Material(
      color: Colors.transparent ,

      elevation: 1.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Colors.black,
      child: Center(
        child:Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child:Text(title,style:TextStyle(
                      fontSize: 30.0,
                      color:  Color(0xFFFAFAFA),
                    ),),
                  ),

                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child:Text(subtitle,style:TextStyle(
                      color:  Colors.white54,
                      fontSize: 20.0,
                    ),),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final md = MediaQuery.of(context);
    if (md.orientation == Orientation.landscape) {
      return _widget();
    }
    return _widget();
  }

  @override
  void dispose() {
    //controller.dispose();
    super.dispose();
  }
}
