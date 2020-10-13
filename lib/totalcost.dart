//import 'package:coffeeapp1/totalprice.dart';
import 'package:coffeeapp1/constants.dart';
//import 'package:coffeeapp1/payment.dart';
import 'package:flutter/material.dart';
import 'package:coffeeapp1/homepage.dart';


List<int> costforcoffee = Totalprice.costforcoffee;
int totalprice = Totalprice.totalprice;

class Payment extends StatefulWidget {

  Payment();
  _PaymentState createState() =>
      _PaymentState();
}

class Totalprice {
  static List<int> costforcoffee=[];
  static int totalprice=40;
}

class _PaymentState extends State<Payment> {

  _PaymentState();

  Widget build(BuildContext context) {
    Future<void> gotopaymentpage() async {
      Navigator.pushNamed(context,payment);
    }

    Widget pricelist(BuildContext context, int index) {
      return Card(
          child: ListTile(
        title: Text(coffeeName1[index]),
        subtitle: Text('Rs.${coffeeCost1[index]}  Quantity:${n1[index]}'),
        trailing: Text('Rs.${costforcoffee[index]}'),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Summary',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                  color: Colors.orange[600],
                  width: 400,
                  child: FlatButton(
                      onPressed: () {
                        print('$totalprice');
                      },
                      child: Text(
                        'Add or Change Address',
                        style: TextStyle(color: Colors.white),
                      )))),
          Card(
              child: Padding(
                  padding: EdgeInsets.only(
                      top: 10, bottom: 10, right: 140, left: 140),
                  child: Text(
                    'Price Details',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18),
                  ))),
          ListView.builder(
            shrinkWrap: true,
            itemCount: coffeeName1.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return pricelist(context, index);
            },
          ),
          Card(
              child: ListTile(
            title: Text('Total Price:'),
            subtitle: Text('Added delivery charge:Rs.40'),
            trailing: Text(
              'Rs.$totalprice',
              style: TextStyle(fontSize: 17),
            ),
          ))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        height: 60,
        padding: EdgeInsets.all(15),
        child: Row(
          children: <Widget>[
            Text(
              'Rs.$totalprice',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              width: 180,
            ),
            FlatButton(
              onPressed: () {
                gotopaymentpage();
              },
              child: Text('CONTINUE'),
              color: Colors.orange[600],
              textColor: Colors.white,
            )
          ],
        ),
      )),
    );
  }
}
