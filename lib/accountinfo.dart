
import 'dart:io';
//import 'dart:async';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeeapp1/constants.dart';
//import 'package:coffeeapp1/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:image_crop/image_crop.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
//import 'package:network_to_file_image/network_to_file_image.dart';
import 'package:path_provider/path_provider.dart';
      String fileurl=Profileimage.fileurl;
      String imagename=Profileimage.lastfilename;


class Accountinfo extends StatefulWidget {

  @override
  _AccountinfoState createState() => _AccountinfoState();
}

class Profileimage{
 static String fileurl;
 static String lastfilename;
  
}
 

class _AccountinfoState extends State<Accountinfo> {
  String uqid;
  String jp='swasthik';
FirebaseAuth _firebaseAuth;
  List<String> fields = []; //['firstname','lastname','email'];
  List<String> fieldname = ['firstname', 'lastname', 'email'];
   List<String> fieldnameapp = ['Firstname', 'Lastname', 'Email ID'];
   GlobalKey<FormState> firstnamekey=GlobalKey();
     GlobalKey<FormState> lastnamekey=GlobalKey();
       GlobalKey<FormState> emailkey=GlobalKey();
       GlobalKey<FormState> pwdkey=GlobalKey();
       TextEditingController firstnamecontroller;
        TextEditingController lastnamecontroller;
         TextEditingController emailcontroller;
         TextEditingController pwdcontroller;
         File imagefile;
         bool imagebool=false;
         File imagefil;
         File samplefile;
         File samplefile2;
         File imagefil2;
         File _finalimagefile;
        final cropkey=GlobalKey<CropState>();
        StorageReference storageReference;
    File finaltest;
    var filepath;
   
    
        
     

  @override
  void initState() {
    _firebaseAuth=FirebaseAuth.instance;
    _firebaseAuth.currentUser().then((value) async {
 
      uqid = value.uid;
      for (var i = 0; i < 3; i++) {
        Firestore.instance
            .collection('users')
            .document(uqid)
            .get()
            .then((onValue) {
              
          fields.add(onValue.data[fieldname[i]]);
        });
        print(uqid);
      }
      firstnamecontroller=TextEditingController();
      lastnamecontroller=TextEditingController();
      emailcontroller=TextEditingController();
      pwdcontroller=TextEditingController();
      storageReference=FirebaseStorage.instance.ref().child('$uqid/profile_photo');
     print(fileurl);
    var direc=await getApplicationDocumentsDirectory();
     filepath=direc.path;
   //     print(filepath);
   //  print('$filepath.path');
    
    
    });
  
    super.initState();
  }
  @override
  void dispose() {
    firstnamecontroller.dispose();
    lastnamecontroller.dispose();
    emailcontroller.dispose();
    pwdcontroller.dispose();
    uqid='';
    

    
    

    super.dispose();
  }

  // Widget purchasehistory(BuildContext context,int index,AsyncSnapshot<dynamic> snapshot){

  //  return
  // ListView.builder(physics: NeverScrollableScrollPhysics(),
  //   itemCount: {snapshot.data.documents[index]['coffeeName']}.length,
  //   itemBuilder:(context,index1){
  // return ListTile(
  //leading: Image.asset(snapshot.data.documents[index]['coffeeImage[0]'][index1]),
  //   title: Text(snapshot.data.documents[index]['coffeeName'][0]),

  //  );
  // }
  //);
  // }

  @override
  Widget build(BuildContext context) {
     Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account info',
          style: TextStyle(color: Colors.orange, fontStyle: FontStyle.italic),
        ),
        backgroundColor: Colors.brown,
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: ()async{
          if (fileurl==null) {
            imagefile=null;
            samplefile=null;
          
          imagefile=await ImagePicker.pickImage(source: ImageSource.gallery);
        samplefile=await ImageCrop.sampleImage(file:imagefile,preferredSize: context.size.longestSide.ceil());
        print('hey samplefile $samplefile');
        imagefil=null;
        samplefile2=null;
       
          imagefil=imagefile;
          samplefile2=samplefile;
           print('hey samplefile2 $samplefile2');
            print('hey imagefil $imagefil');
       
            }else{
                var dir=await  getApplicationDocumentsDirectory();
    filepath=dir.path;
             finaltest=File('$filepath/$imagename');
          
             samplefile2=finaltest;
            }
            showDialog(context: context,
             builder:(context){return StatefulBuilder(builder: (context,setstate){

         return
             AlertDialog(
               content: Container(
               //  child:Crop(image:FileImage(samplefile2),key: cropkey,aspectRatio: 4/3,)
                 child: Crop.file(samplefile2,key:cropkey,)
                 ),
  
              
               actions: <Widget>[
              fileurl!=null?
                FlatButton(onPressed: ()async{
                  setState(() {
                storageReference.child(path.basename(_finalimagefile.path)).delete();
                    print('deleted');
                    _finalimagefile=null; 
                    fileurl=null;
                    File('$filepath/$imagename').delete(recursive:false);
                 
                  });
                 
                  Navigator.pop(context);
                }, child:Text('remove photo')):null,

                  FlatButton(onPressed: ()async{
                 
                           imagefile=null;
                    samplefile=null;
                    imagefile=await ImagePicker.pickImage(source: ImageSource.gallery);
        samplefile=await ImageCrop.sampleImage(file:imagefile,preferredSize: context.size.longestSide.ceil());
        if(fileurl!=null){
        storageReference.child(imagename).delete();
        fileurl=null;
        File('$filepath/$imagename').delete(recursive: false);
        imagename=null;}
        print('deleted');
       setstate(() {
           samplefile2=null;
        imagefil=null;
        _finalimagefile=null;
                imagefil=imagefile;
          samplefile2=samplefile;
           print('hey samplefile2 $samplefile2');
            print('hey imagefil $imagefil');
       });
       },
                 child: Text('gallery')),

                 FlatButton(onPressed: (){
                 
                  cropimage();
                       
          
                  Navigator.pop(context);
                 
                 }, child: Text('OK')),
                 FlatButton(onPressed: (){
                    
                   Navigator.pop(context);
          
                 }, child: Text('cancel'))
               ],
             );
             })
             ;}
            );
       //      setState((){
       //      imagebool=true;
       //      });
           
             
              },
            child:
         CircleAvatar(
           backgroundColor: Colors.brown,
            radius: 60,
        //    backgroundImage:_finalimagefile!=null? FileImage( _finalimagefile,): null,//IconData(codePoint)
       //     Icon(
      ////    Icons.account_circle,
      //       size: 55,
     //     ),//filterQuality: FilterQuality.low,cacheWidth:200,cacheHeight:250,) ,
          child:fileurl!=null?
          ClipOval(child:Image.network(fileurl))
           : Icon(
           Icons.account_circle,
           color: Colors.white,
             size: 55,
          )
    //  child: Icon(Icons.account_circle),
            ),
          ),
          
          StreamBuilder<DocumentSnapshot>(
              stream: Firestore.instance
                  .collection('users')
                  .document(uqid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Card(
                    child: Text('loading'),
                  );
                } else {
                  return ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                     // itemCount: 3,
                     // itemBuilder: (context, int index) {
                       children: <Widget>[
                         Card(child:
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                        Padding(padding:EdgeInsets.only(left:17),child:Text('Firstname',style: TextStyle(fontSize:17,fontWeight:FontWeight.w500),)),
                         ListTile(
                          title: Text(fields[0]),
                          trailing:FlatButton.icon(onPressed:(){
                           setState(() {
                             showDialog(context: context,
                              builder: (BuildContext context){
                            return
                            AlertDialog(
                                title: Text('Enter Firstname'),
                                content:Form(key:firstnamekey ,
                                  child: 
                                TextFormField(
                                  decoration:InputDecoration(hintText:'Jack'),
                                  validator: (text){
                                    if(text.length<3){
                                      return 'enter a valid firstname';
                                  }else return null;
                                  },
                                  controller:firstnamecontroller ,
                                  
                                ),),
                                actions: <Widget>[
                                  FlatButton(onPressed: (){
                                   if( firstnamekey.currentState.validate()){
                                    Firestore.instance.collection('users').document(uqid).setData({
                                      'firstname':firstnamecontroller.text
                                    },merge:true);
                                    fields[0]=firstnamecontroller.text;
                                    firstnamecontroller.clear();
                                    Navigator.pop(context);
                                   }
                                  }, child:Text('OK')),
                                  FlatButton(onPressed: (){
                                    firstnamecontroller.clear();
                                    Navigator.pop(context);
                                  
                                  },
                                   child: Text('Cancel'))
                                ],
                              );
                              }
                            );
                           });
                          },
                          
                           icon:  Icon(Icons.edit), 
                           
                           label:Text('edit')),
                      
                        )
        ])
                        ),

                         Card(child:
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                        Padding(padding:EdgeInsets.only(left:17),child:Text('Lastname',style: TextStyle(fontSize:17,fontWeight:FontWeight.w500),)),
                         ListTile(
                          title: Text(fields[1]),
                          trailing:FlatButton.icon(onPressed:(){
                        setState(() {
                           showDialog(context: context,
                              builder: (BuildContext context){
                            return
                            AlertDialog(
                                title: Text('Enter Lastname'),
                                content:Form(key:lastnamekey ,
                                  child: 
                                TextFormField(
                                  decoration:InputDecoration(),
                                  validator: (text){
                                    if(text.length<2){
                                      return 'enter a valid Lastname';
                                  }else return null;
                                  },
                                  controller:lastnamecontroller ,
                                  
                                ),),
                                actions: <Widget>[
                                  FlatButton(onPressed: (){
                                   if( lastnamekey.currentState.validate()){
                                    Firestore.instance.collection('users').document(uqid).setData({
                                      'lastname':lastnamecontroller.text
                                    },merge:true);
                                    fields[1]=lastnamecontroller.text;
                                    lastnamecontroller.clear();
                                    Navigator.pop(context);
                                   }
                                  }, child:Text('OK')),
                                  FlatButton(onPressed: (){
                                    lastnamecontroller.clear();
                                    Navigator.pop(context);
                                  },
                                   child: Text('Cancel'))
                                ],
                              );
                              }
                            );
                        });
                         
                          },
                          
                           icon:  Icon(Icons.edit), 
                           
                           label:Text('edit')),
                      
                        )
        ])
                        ),

                          Card(child:
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                        Padding(padding:EdgeInsets.only(left:17),child:Text('Email ID',style: TextStyle(fontSize:17,fontWeight:FontWeight.w500),)),
                         ListTile(
                          title: Text(fields[2]),
                   
                      
                        )
        ])
                        ),



                               Card(child:
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                      //  Padding(padding:EdgeInsets.only(left:17),child:Text('Lastname',style: TextStyle(fontSize:17,fontWeight:FontWeight.w500),)),
                         ListTile(
                          title: Text('Change Password'),
                          onTap: (){
                            showDialog(context: context,
                            builder: (context){
                            return AlertDialog(
                              title: Text('Change Password'),
                              content: Text('An email will be sent to your email id,open the link to change password'),
                              actions: <Widget>[
                                 FlatButton(onPressed: (){
                                   _firebaseAuth.sendPasswordResetEmail(email: fields[2]);
                                   Navigator.pop(context);
                                  },
                                   child: Text('OK')),

                                       FlatButton(onPressed: (){
                                Navigator.pop(context);
                                  }
                                  , child:Text('Cancel')
                                  ),
                              ],
                            );
                            });

                            
                          },
                       
                        )
        ])
                        ),
                          ]
          );   
                }
              }),
                      
                     Padding(padding:EdgeInsets.only(left:size.width*0.040,right:size.width*0.040,bottom: size.height*0.05,top: size.height*0.05 ),
                      child:  FlatButton(onPressed: (){
                       FirebaseAuth.instance.signOut();
                          Navigator.pushNamedAndRemoveUntil(context,loginpage,(Route<dynamic> route)=>false);
                         
                        },
                         child:Text('Log Out',style: TextStyle(fontWeight:FontWeight.bold),),
                         padding: EdgeInsets.all(20),
                         
                         color: Colors.orange,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),)
                     )
       ,

        
        ],
      ),
    );
  }

  cropimage()async{
   var  scale=cropkey.currentState.scale;
   var area=cropkey.currentState.area;
   if(area==null){
     return;
   }
   final samplefile3=await ImageCrop.sampleImage(file:imagefil,preferredSize:(2000/scale).round());
    print('hey samplefile3 $samplefile3');
   final imagefile3=await ImageCrop.cropImage(file: samplefile3,area:area);
   _finalimagefile=null;
   setState(() {
    _finalimagefile=imagefile3; 
   });
  
   print(path.basename(_finalimagefile.path));
      print(path.basename(_finalimagefile.path));

   StorageUploadTask storageUploadTask=storageReference.child(path.basename(_finalimagefile.path)).putFile(_finalimagefile);
   await storageUploadTask.onComplete;
   print('completed');
   storageReference.child(path.basename(_finalimagefile.path)).getDownloadURL().then((onValue){
        setState(() {
          fileurl=onValue;
         print('finaltest:$finaltest');
 });
    
   });
      imagename=path.basename(_finalimagefile.path);
          print(fileurl);
          print(imagename);
  //  var dir=await  getApplicationDocumentsDirectory();
  //  filepath=dir.path;
    finaltest=await _finalimagefile.copy('$filepath/$imagename');
  
  }
}
