
import 'package:coffeeapp1/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GettingStarted extends StatefulWidget {
  @override
  _GettingStartedState createState() => _GettingStartedState();
}

class _GettingStartedState extends State<GettingStarted> {
GlobalKey<FormState> formkey=GlobalKey();
GlobalKey<FormState> changepass=GlobalKey();
TextEditingController changepasscontroller;
TextEditingController emailcontroller;
TextEditingController pwdcontroller;
@override
  void initState() {
 emailcontroller=TextEditingController();
 pwdcontroller=TextEditingController();
 changepasscontroller=TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
 emailcontroller.dispose();
 pwdcontroller.dispose();
 changepasscontroller.dispose();
    super.dispose();
  }
  @override

  Widget build(BuildContext context) {
 Size screensize=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:Colors.brown[800],
   body:
  Form(key: formkey,child: 
   ListView(children: <Widget>[
      SizedBox(height:20),
    Center(
      child: CircleAvatar(
        radius: 60,
        backgroundImage:AssetImage('assets/logo.jpg'),
         ),

    ),
    SizedBox(height:10),
    Center(child:Text('COFFEE HOUSE',style: TextStyle(
       color: Colors.orange[400],fontSize:20,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic
      ),),
    ),
      SizedBox(height:100),
    Center(child:  Text('Login',style:TextStyle(color:Colors.white,fontSize: 20)),
    ),
    
    

     SizedBox(
      height: 30,
      ),
    
   TextFormField(
      decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(width:2)), 
     enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    disabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.red,width:2)),
      focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.red,width:2)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.orange,width:2),) ,
        labelText: 'email',labelStyle: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),
        hintText: "john.doe@gmail.com",
        fillColor: Colors.white,
      filled:true
      ),
      controller: emailcontroller,
      keyboardType:TextInputType.emailAddress,
      validator: (value){
        Pattern pattern;
        pattern= r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regExp=RegExp(pattern);
        if(!regExp.hasMatch(value)){
          return 'enter a valid email id';
        }else{
          return null;
        }
      },

   ),

    SizedBox(
      height: 12,
      ),
   TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(width:2)), 
     enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    disabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.red,width:2)),
      focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.red,width:2)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.orange,width:2),) ,
        labelText: 'Password',labelStyle: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold,),
        hintText:  "********",
        fillColor: Colors.white,
      filled:true,
     ),
      controller: pwdcontroller,
      validator: (value){
        if(value.length<6){
          return 'password must be longer than 5 characters';
        }else{
          return null;
        }
      },
        obscureText:true,
   ),
 SizedBox(
      height: 40,
      ),
 //     FlatButton(onPressed:(){
 //       FirebaseAuth.instance.sendPasswordResetEmail(email: emailcontroller.text);
 //     }, child: Text('data')),
 Padding(padding: EdgeInsets.only(left:screensize.width*0.30,right:(screensize.width*0.30)),
   child:
  FlatButton(onPressed:(){
   
      if(formkey.currentState.validate()){
    
        FirebaseAuth.instance.signInWithEmailAndPassword(email: emailcontroller.text, password: pwdcontroller.text)
       .then((currentUser){
   //   if(currentUser!=null){
      
          Firestore.instance.collection('users').document(currentUser.user.uid).get().then((userinformation){
          Navigator.pushReplacementNamed(context,homepage);
          }).catchError((error){
            print(error);
          } );
      //  }else{
      //    showDialog(context: context,
      //    builder:(context){
      //    return AlertDialog(
      //       title: Text('Invalid account'),
      //       content: Text('No such account was found'),
      //       actions: <Widget>[
      //         FlatButton(onPressed: (){
      //           Navigator.of(context).pop();
      //         }, child: Text('Cancel'))
      //       ],
      //     );
      //    });
      //  }
        }
      )
          .catchError((PlatformException error){
          print('hey error'+error.message);
       
        });
      //  .whenComplete((){
      //   return  showDialog(context: context,
      //    builder:(context){
      //    return AlertDialog(
      //       title: Text('Invalid account'),
      //       content: Text('No such account was found'),
      //       actions: <Widget>[
      //         FlatButton(onPressed: (){
      //           Navigator.of(context).pop();
      //         }, child: Text('Cancel'))
      //       ],
      //     );
      //    });
      //  });
      }
     }, 
    shape:RoundedRectangleBorder(borderRadius:BorderRadiusDirectional.circular(15)),
     child: Text('Login'),
     textColor: Colors.white,
     color: Colors.orange,
  )
 
     ),


     Padding(padding:EdgeInsets.only(top:20,bottom:5),child:
     FlatButton(onPressed: (){
       setState(() {
         showDialog(context:context,
         builder: (context){
           return AlertDialog(
             title:Text('Change password'),
             content: Form(key: changepass,child: 
             Column(children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'enter email id'),
                 validator: (value){
        Pattern pattern;
        pattern= r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regExp=RegExp(pattern);
        if(!regExp.hasMatch(value)){
          return 'enter a valid email id';
        }else{
          return null;
        }
      },
      controller: changepasscontroller,
              ),
              Text('an email will be sent to your email id,open the link to change password')
             ],
             ),
             ),
               actions: <Widget>[
                   FlatButton(onPressed: (){
                     if(changepass.currentState.validate()){
                                   FirebaseAuth.instance.sendPasswordResetEmail(email:changepasscontroller.text);
                                   Navigator.pop(context);
                                   changepasscontroller.clear();
                     }
                                  },
                                   child: Text('OK')),

                                       FlatButton(onPressed: (){
                                Navigator.pop(context);
                                changepasscontroller.clear();
                                  }
                                  , child:Text('Cancel')
                                  ),
               ],
             );
         }
           );

         
       }
       );
     },
      child: Text('forgot password?',style: TextStyle(color: Colors.white),),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.orange,
      ),
   ),

Container(decoration: BoxDecoration(borderRadius:BorderRadius.circular(15),color: Colors.orange),padding: EdgeInsets.only(left: screensize.width*0.05,right:screensize.width*0.05),
  child:
   
        FlatButton(shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),onPressed: (){
          Navigator.pushReplacementNamed(context,signuppage);
        }, child: Text('Don\'t have an account? Create an account',style: TextStyle(color: Colors.white),)) 
        
)
 


   
    ],),
  
    )
   
    );
    
  }
}