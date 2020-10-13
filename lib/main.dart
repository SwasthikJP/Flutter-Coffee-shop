
//import 'package:coffeeapp1/constants.dart';
//import 'package:coffeeapp1/gettingstarted.dart';
//import 'package:coffeeapp1/homepage.dart';
//import 'package:coffeeapp1/constants.dart';
//import 'package:coffeeapp1/gettingstarted.dart';
import 'package:coffeeapp1/router.dart';
import 'package:coffeeapp1/splashpage.dart';
import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';



void main() => runApp(new MyApp());
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
   
    return  MaterialApp(
      title:'coffee',
      onGenerateRoute: Router.generateRoute,
      debugShowCheckedModeBanner: false,
     home: Splash(),
    );
    
  }
  }

