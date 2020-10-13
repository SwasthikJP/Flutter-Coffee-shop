import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeeapp1/constants.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    FirebaseAuth.instance.currentUser().then((currentUser){
      if(currentUser==null){
        Navigator.pushReplacementNamed(context,loginpage);
      }
      else{
        Firestore.instance.collection('users').document(currentUser.uid).get().then((result){
   Navigator.pushReplacementNamed(context, homepage);
  
        }).catchError((error){
          print(error);
        });
      }
    }).catchError((error){
      print(error);
    });
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.brown[800],
      body:
      
        Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
        //   CircleAvatar(backgroundImage: AssetImage('assets/logo.jpg'),radius: 55,),
        //   SizedBox(height: 10,),
           Text('COFFEE HOUSE',style: TextStyle(
      color: Colors.orange[400],fontSize:30,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic
     ),),
         ],)),
       
      
    );
  }
}