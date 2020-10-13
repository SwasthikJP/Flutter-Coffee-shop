import 'package:coffeeapp1/constants.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:coffeeapp1/homepage.dart';


class Thanks extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Future<void> gotohome() async {


      for (var i = 0; i < 12; i++) {
     //   productList[i].isSelected = [true, false];
     //   productList[i].n = 1;
productList=[];
        firstpress[i] = true;
      }
      //totalprice=40;
      totalpricepress = true;
      // costforcoffee=[];
      // firstpressindex=[];
            coffeeName1=[];
   coffeeImage1=[];
     coffeeCost1=[];
   isSelected1=[];
    n1=[];

     Navigator.pushNamedAndRemoveUntil(context,homepage,(Route<dynamic> route)=>false);
    }

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Image.asset('assets/logo.jpg'),
          backgroundColor: Colors.brown[800],
          title: Text(
            'Confirmation',
            style: TextStyle(
                color: Colors.orange[400], fontStyle: FontStyle.normal),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(top: 25, bottom: 10),
                alignment: Alignment.center,
                child: Text(
                  'Confirmed!',
                  style: TextStyle(color: Colors.brown, fontSize: 22),
                )),
            Container(
                padding: EdgeInsets.only(bottom: 15),
                alignment: Alignment.center,
                child: Text(
                  'Thank you for your order',
                  style: TextStyle(color: Colors.brown, fontSize: 17),
                )),
            Container(
              child: Image.asset(
                'assets/delivery1.jpg',
                fit: BoxFit.cover,
              ),
              alignment: Alignment.center,
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                child: FlatButton(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  onPressed: () {
                    gotohome();
                  },
                  child: Text(
                    'Continue Shopping',
                    style: TextStyle(fontSize: 17),
                  ),
                  textColor: Colors.white,
                  color: Colors.brown,
                ),
              ),
            ),
          ],
        ));
  }
}
