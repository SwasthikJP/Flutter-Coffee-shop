

import 'package:coffeeapp1/accountinfo.dart';
import 'package:coffeeapp1/cart.dart';
import 'package:coffeeapp1/constants.dart';
import 'package:coffeeapp1/login.dart';
import 'package:coffeeapp1/homepage.dart';
import 'package:coffeeapp1/payment.dart';
import 'package:coffeeapp1/signup.dart';
import 'package:coffeeapp1/splashpage.dart';
import 'package:coffeeapp1/thanks.dart';
import 'package:coffeeapp1/totalcost.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Router{
static  Route<dynamic> generateRoute(RouteSettings settings){
switch (settings.name){
case loginpage:
return MaterialPageRoute(builder: (context)=>GettingStarted());

case homepage:
return MaterialPageRoute(builder: (context)=>HomePage());

case cartpage:
return MaterialPageRoute(builder: (context)=>Cart());

case totalcost:
return MaterialPageRoute(builder: (context)=>Payment());

case payment:
return MaterialPageRoute(builder: (context)=>Paymentconfirm());

case thanks:
return MaterialPageRoute(builder: (context)=>Thanks());

case signuppage:
return MaterialPageRoute(builder: (context)=>Signup());

case splashpage:
return MaterialPageRoute(builder: (context)=>Splash());

case accountpage:
return MaterialPageRoute(builder: (context)=>Accountinfo());

default:
return MaterialPageRoute(builder: (context)=>HomePage());

}
  }
}