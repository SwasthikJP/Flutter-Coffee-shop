import 'package:coffeeapp1/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeeapp1/totalcost.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:coffeeapp1/totalcost.dart';
import 'package:flutter/material.dart';
import 'package:coffeeapp1/homepage.dart';


class Paymentconfirm extends StatefulWidget {
  @override
  _PaymentconfirmState createState() => _PaymentconfirmState();
}

class _PaymentconfirmState extends State<Paymentconfirm> {

   int currentpress=0;
   var now=DateTime.now();
  

  @override
  

  Widget build(BuildContext context) {
 Future<void> gotothanks()async{
   FirebaseAuth.instance.currentUser().then((currentUser){
     Firestore.instance.collection('users').document(currentUser.uid).collection('purchaseditems').add({
   
//Firestore.instance.collection('purchaseditems').add({
'coffeeName':List.from(coffeeName1),
'coffeeCost':List.from(coffeeCost1),
'isSelected':List.from(isSelected1),
'n':List.from(n1),
'coffeeImage':List.from(coffeeImage1),
'costforcoffee':List.from(costforcoffee),
'totalprice':totalprice,
'date':now
}).catchError((error){
  print(error);
});});

   Navigator.pushNamed(context,thanks);

  
 }
 
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.brown[800],
        title:Text('COFFEE HOUSE',style: TextStyle(color: Colors.orange[400],fontStyle: FontStyle.italic),),
        ),
        body: ListView(
          children: <Widget>[
            Container(child:Text('Select your payment method',style: TextStyle(color: Colors.black,fontSize:20,),),
            padding: EdgeInsets.all(25),
            alignment: Alignment.center,),
            Divider(
              thickness: 5,height: 5,
            ),
            ListView(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                  Card(child:ListTile(
                    onTap: (){setState(() {
                    currentpress=0;
                  });},
                  contentPadding: EdgeInsets.all(10),
                  leading: Radio(value:0, groupValue: currentpress,activeColor: Colors.orange[400], onChanged: (int value){
                  setState(() {
                    currentpress=value; 
                  }); 
                  }),
                  title: Text('Cash on delivery',style: TextStyle(fontWeight: FontWeight.bold),),
                )),
                Card(child:  ListTile(
                  onTap: (){setState(() {
                    currentpress=1;
                  });},
                  contentPadding: EdgeInsets.all(10),
                  leading: Radio(value:1, groupValue:currentpress,activeColor: Colors.orange[400], onChanged: (int value){
                  setState(() {
                     currentpress=value;
                  }); 
                  }),
                  title: Text('UPI',style: TextStyle(fontWeight: FontWeight.bold),),
                )),
                Card(child: ListTile(
                  onTap: (){setState(() {
                    currentpress=2;
                  });},
                  contentPadding: EdgeInsets.all(10),
                  leading: Radio(value:2, groupValue:currentpress,activeColor: Colors.orange[400], onChanged: (int value){
                  setState(() {
                     currentpress=value;
                  }); 
                  }),
                  title: Text('Add Debit/Credit/ATM card',style: TextStyle(fontWeight: FontWeight.bold),),
                )),
                Card(child: ListTile(
                  onTap: (){setState(() {
                    currentpress=3;
                  });},
                  contentPadding: EdgeInsets.all(10),
                  leading: Radio(value:3, groupValue: currentpress,activeColor: Colors.orange[400], onChanged: (value){
                  setState(() {
                     currentpress=value;

                  }); 
                  }),
                  title: Text('Net Banking',style: TextStyle(fontWeight: FontWeight.bold),),
                )),
              ],
            ),
            Padding(padding: EdgeInsets.all(10),
              child:Container(child:FlatButton(onPressed: (){
                gotothanks();
                },
               color: Colors.brown,textColor: Colors.white,padding: EdgeInsets.all(25),
              child:Text('Confirm Order',style:TextStyle(fontSize: 17)) ))),
           
          ],
        ),
    );
  }
}