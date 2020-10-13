import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeeapp1/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  GlobalKey<FormState> formkey=GlobalKey();
 TextEditingController firstnamecontroller;
     TextEditingController lastnamecontroller;
      TextEditingController pwdcontroller;
       TextEditingController confirmpwdcontroller;
       TextEditingController emailcontroller;
  @override
  void initState() {
  firstnamecontroller=TextEditingController();
   lastnamecontroller=TextEditingController();
    pwdcontroller=TextEditingController();
     confirmpwdcontroller=TextEditingController();
     emailcontroller=TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    firstnamecontroller.dispose();
  lastnamecontroller.dispose();
    pwdcontroller.dispose();
     confirmpwdcontroller.dispose();
     emailcontroller.dispose();
    
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size screensize=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.brown[800],
      body:Form(key: formkey,child: 
    ListView(
      children: <Widget>[
        Center(
       child: CircleAvatar(
          backgroundImage: AssetImage('assets/logo.jpg'),
          radius: 35,
        )
    ),
    SizedBox(
      height: 10,
    ),
    Center(
     child:Text('Sign in',style: TextStyle(fontSize: 20,color: Colors.orange[600]),)
    ),
    Divider(
      height: 10,
      thickness: 5,
    ),
   
    TextFormField(
      decoration:InputDecoration(
             border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(width:2)), 
     enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    disabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.red,width:2)),
      focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.red,width:2)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.orange,width:2),) ,
        labelText: 'First Name',labelStyle: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold,),
        hintText: 'Jack',
        fillColor: Colors.white,
        filled: true
      ),
      controller: firstnamecontroller,
      validator: (value){
        if(value.length<3){
          return 'enter a valid firstname'; 
        }else{
          return null;
        }
      },

    
    ),
 SizedBox(
      height: 12,
      ),
     TextFormField(
      decoration:InputDecoration(
             border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(width:2)), 
     enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    disabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.red,width:2)),
      focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.red,width:2)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.orange,width:2),) ,
        labelText: 'Last Name',labelStyle: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold,),
        fillColor: Colors.white,
        filled: true
 ),
 controller: lastnamecontroller,
  validator: (value){
        if(value.length<2){
          return 'enter a valid lastname'; 
        }else{
          return null;
        }
      },
    
    ),
     SizedBox(
      height: 12,
      ),
TextFormField(
      decoration:InputDecoration(
             border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(width:2)), 
     enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    disabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.red,width:2)),
      focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.red,width:2)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.orange,width:2),) ,
        labelText: 'Email',labelStyle: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold,),
        hintText: "john.doe@gmail.com",
        fillColor: Colors.white,
        filled: true
      ),
      controller: emailcontroller,
       validator: (value){
        Pattern pattern;
        pattern= r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regExp=RegExp(pattern);
        if(!regExp.hasMatch(value))
        {
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
      decoration:InputDecoration(
             border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(width:2)), 
     enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    disabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.red,width:2)),
      focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.red,width:2)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.orange,width:2),) ,
        labelText: 'Password',labelStyle: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold,),
         fillColor: Colors.white,
        filled: true
      ),
      controller: pwdcontroller,
      validator: (value){
        if(value.length<6){
          return 'password must be longer than 5 characters'; 
        }else{
          return null;
        }
      },
      obscureText: true,
    
    ),
 SizedBox(
      height: 12,
      ),
     TextFormField(
      decoration:InputDecoration(
             border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(width:2)), 
     enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    disabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.red,width:2)),
      focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.red,width:2)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.orange,width:2),) ,
        labelText: 'Confirm Password',labelStyle: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold,),
         fillColor: Colors.white,
        filled: true
      ),
      obscureText: true,
      controller: confirmpwdcontroller,
      validator: (value){
        if(value.length<6){
          return 'password must be longer than 5 characters'; 
        }else{
          return null;
        }
      },
    
    ),
 SizedBox(
      height: 12,
      ),
     Padding(padding: EdgeInsets.only(left: screensize.width*0.25,right: screensize.width*0.25),
       child:FlatButton(onPressed: (){
       if(formkey.currentState.validate())
       {
         if(pwdcontroller.text==confirmpwdcontroller.text){
           FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailcontroller.text, password:pwdcontroller.text)
           .then((currentUser){
             
             Firestore.instance.collection('users').document(currentUser.user.uid).setData({
               'uid':currentUser.user.uid,
               'firstname':firstnamecontroller.text,
               'lastname':lastnamecontroller.text,
               'email':emailcontroller.text
             }).then((userinformation){
               Navigator.pushReplacementNamed(context,homepage);
             }).catchError((error){
               print(error);
             });
           })
           .catchError((error){
             print(error);
           });
         }else{
           showDialog(context: context,
           builder: (context){
            return  AlertDialog(title: Text('Error'),
              content: Text('Passwords do not match'),
              actions: <Widget>[
                FlatButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child:Text('Close'))
              ],);
           });
         }
       }
      
        
       }, child: Text('Sign Up'),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),textColor: Colors.white,
       color: Colors.orange,)
     ),

    Padding(padding:EdgeInsets.only(left:screensize.width*0.05,right:screensize.width*0.05),child:
        FlatButton(onPressed: (){
          Navigator.pushReplacementNamed(context,loginpage);
        }, child: Text('Have an account?  Log In',style: TextStyle(color: Colors.white),),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.orange,
        ) 
    )
      ],
    ),
      ),
    );
  }
}