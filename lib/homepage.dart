
import 'package:coffeeapp1/constants.dart';
import 'package:flutter/material.dart';
import 'package:coffeeapp1/totalcost.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
var firstpress=FirstPress.firstpress;
var firstpressindex=FirstPress.firstpressindex;
List<CoffeeList> productList=FirstPress.productList;
bool totalpricepress=Totalpricepress.totalpricepress;

List<String>coffeeName1=FirstPress.coffeeName1;
   List<String>coffeeImage1=FirstPress.coffeeImage1;
List<int> coffeeCost1=FirstPress.coffeeCost1;
 List <String> isSelected1=FirstPress.isSelected1;
List<int> n1=FirstPress.n1;


class Totalpricepress{
static bool totalpricepress=true;

}


class HomePage extends StatefulWidget {


 
  @override
  _HomePage createState() => _HomePage();
}



  class CoffeeList{
  String coffeeName;
  String coffeeImage;
  int coffeeCost;
  List<bool> isSelected;
    int n;
    
    
CoffeeList({this.coffeeName,this.coffeeImage,this.coffeeCost,this.isSelected,this.n});
  
}


class FirstPress{
static List <bool> firstpress=[true,true,true,true,true,true,true,true,true,true,true,true,];
static List <int> firstpressindex=[];
 static List<CoffeeList> productList=[];
   //   CoffeeList (coffeeName:'AMERICANO',
   //   coffeeImage:'assets/poster1.jpg',
   //   coffeeCost:100,
   //   isSelected:[true,false],
   //   n:1
   //   ),
   //   CoffeeList (coffeeName:'LATTE',
   //   coffeeImage:'assets/poster2.jpg',
   //   coffeeCost:95,
   //   isSelected:[true,false],
   //   n:1
   //   ),
   //   CoffeeList (coffeeName:'CAPPUCCINO',
   //   coffeeImage:'assets/poster3.jpg',
   //   coffeeCost:91,
   //   isSelected:[true,false],
   //   n:1
   //   ),
   //   CoffeeList (coffeeName:'MACHIATO',
   //   coffeeImage:'assets/poster4.jpg',
   //   coffeeCost:100,
   //   isSelected:[true,false],
   //   n:1
   //   ),
   //   CoffeeList (coffeeName:'GLACE',
   //   coffeeImage:'assets/poster5.jpg',
   //   coffeeCost:120,
   //   isSelected:[true,false],
   //   n:1
   //   ),
   //    CoffeeList (coffeeName:'FRAPPE',
   //   coffeeImage:'assets/poster6.jpg',
   //   coffeeCost:120,
   //   isSelected:[true,false],
   //   n:1
   //    ),
   //     CoffeeList (coffeeName:'EXPRESSO',
   //   coffeeImage:'assets/poster7.jpg',
   //   coffeeCost:80,
   //   isSelected:[true,false],
   //   n:1
   //     ),
   //      CoffeeList (coffeeName:'MOCHA',
   //   coffeeImage:'assets/poster8.jpg',
   //   coffeeCost:115,
   //   isSelected:[true,false],
   //   n:1
   //     ),
   //      CoffeeList (coffeeName:'FREDO',
   //   coffeeImage:'assets/poster9.jpg',
   //   coffeeCost:120,
   //   isSelected:[true,false],
   //   n:1
   //     ),
   //        CoffeeList (coffeeName:'IRISH',
   //   coffeeImage:'assets/poster10.jpg',
   //   coffeeCost:120,
   //   isSelected:[true,false],
   //   n:1
   //     ),
   //        CoffeeList (coffeeName:'COCOA',
   //   coffeeImage:'assets/poster11.jpg',
   //   coffeeCost:120,
   //   isSelected:[true,false],
   //   n:1
   //     ),
   //        CoffeeList (coffeeName:'CHOCOLATE',
   //   coffeeImage:'assets/poster12.jpg',
   //   coffeeCost:100,
   //   isSelected:[true,false],
   //   n:1
   //     ),
   //     
   //   
   //   
   //   
   //  ];
static     List<String> coffeeName1=[];
 static   List<String>coffeeImage1=[];
  static  List<int> coffeeCost1=[];
  static  List <String> isSelected1=[];
   static  List<int> n1=[];

}




class _HomePage extends State<HomePage> {



  
  

 
 @override
 
  Widget build(BuildContext context) {
 
    
   Widget product(BuildContext context,int index,AsyncSnapshot snapshot){
     
 productList.add(CoffeeList
   (coffeeCost:snapshot.data.documents[index]['coffeeCost'],
   coffeeName: snapshot.data.documents[index]['coffeeName'],
   coffeeImage: snapshot.data.documents[index]['coffeeImage'],
   isSelected:List.from(snapshot.data.documents[index]['isSelected']),//[snapshot.data.documents[index]['isSelected[0]'],snapshot.data.documents[index]['isSelected[1]']],
   n: snapshot.data.documents[index]['n']));



       void add(){
      setState(() {
        productList[index].n++;
      });
  }

  void  sub(){
      setState(() {
         if((productList[index].n)>1){
       productList[index].n--;
     }
      });  
   }

  Future <void> cartbutton()async{
 setState(() {
     if(firstpress[index]==true){
 firstpressindex.add(index);
      firstpress[index]=false;
    coffeeName1.add(productList[index].coffeeName);
   coffeeImage1.add(productList[index].coffeeImage);
   coffeeCost1.add(productList[index].coffeeCost);
 n1.add(productList[index].n);
 if(productList[index].isSelected[0]==true){
isSelected1.add('white sugar');
 }else{
   isSelected1.add('brown sugar');
 }
 totalpricepress=true;
 totalprice=40;
 costforcoffee=[];
 print(totalprice);
 }

 });
   }
 

         return Card(
            child:Row(children: <Widget>[
                 SizedBox(height: 140,width: 140,
                  child:Image.asset( productList[index].coffeeImage),
                // child:Image.asset(snapshot.data.documents[index]['coffeeImage']),
                   ),
                Expanded(child: 
                   Column(
                   
                   crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                 Padding(padding:EdgeInsets.only(left:40,right:10,top:5,bottom:20),child: Text(productList[index].coffeeName,
                // child:Text(snapshot.data.documents[index]['coffeeName'],
                 style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.brown),)),
               
                 
     Padding(padding: EdgeInsets.only(left: 25,bottom:20),child: ToggleButtons(children:[ 
                    Text('WHITE SUGAR',style: TextStyle(fontSize: 10,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
                   Text('BROWN SUGAR',style: TextStyle(fontSize: 10,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),)
                    ],
                    fillColor: Colors.brown,
                    selectedColor: Colors.orange[600],
                    color: Colors.orange[600],
                    borderColor: Colors.brown,
                    borderWidth:3,
                    selectedBorderColor: Colors.brown,
                    borderRadius: BorderRadius.circular(30),
                    isSelected: productList[index].isSelected,
                   
                    onPressed:(int index1){
                      setState(() {
                      for(int buttonindex=0;buttonindex<2;buttonindex++){
                        if(buttonindex==index1){
                          productList[index].isSelected[index1]=true;
                        }
                        else{
                         productList[index].isSelected[buttonindex]=false;
                        }
                      }
                        
                     }); },
                    )
     ),
                
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: <Widget>[
                   SizedBox(width:15),
                    Text('Rs.${productList[index].coffeeCost}',style: TextStyle(color: Colors.orange[600],fontSize: 20,fontWeight: FontWeight.bold,backgroundColor: Colors.brown,),),
                    new FloatingActionButton(onPressed:add,
                    mini: true,
                    heroTag: null,
                    foregroundColor: Colors.orange[600],
                    backgroundColor: Colors.brown,
                    child:Icon(Icons.add,size:15)),
                   Container(child:Text('${productList[index].n}',style: TextStyle(color: Colors.orange[600]),),decoration:BoxDecoration(color:Colors.brown,shape:BoxShape.rectangle,borderRadius: BorderRadius.circular(5) ),padding: EdgeInsets.all(10),
                   ),
                   new FloatingActionButton(onPressed:sub,
                    mini: true,
                    heroTag: null,
                    foregroundColor: Colors.orange[600],
                    backgroundColor: Colors.brown,
                    child:Icon(Icons.remove,size:15)),
                    SizedBox(width:5),
                  
                  ],),
                   Divider(thickness:3,height:10,color: Colors.orange[600],indent: 10,endIndent: 10,),
          Padding(padding: EdgeInsets.only(left:70), child: FloatingActionButton.extended(onPressed: (){
          
           
          cartbutton();
               
          
             },
              label:Text('Add to cart'),icon: Icon(Icons.shopping_cart),heroTag: null,backgroundColor: Colors.brown,foregroundColor: Colors.white,),
          ),
                  
                   ],)
                  ),
            
            ],), 
          );
   }
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.brown[800],
        title:Text('COFFEE HOUSE',style: TextStyle(color: Colors.orange[400],fontStyle: FontStyle.italic),),
       leading:
          Image.asset('assets/logo.jpg'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.account_circle), onPressed: (){
              Navigator.pushNamed(context,accountpage);
            }),
          
            Padding(padding:EdgeInsets.all(8),
          child: IconButton(
            icon:Icon( Icons.shopping_cart),
            onPressed: (){
       //      Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart(mycart)));
       Navigator.pushNamed(context, cartpage );
       //Cart(coffeeName1,coffeeImage1,coffeeCost1,isSelected1,n1)));
            },
           ))
          ],
        ),
        body: 
//        ListView.builder(shrinkWrap: true,
//          itemCount: firstpress.length,
//           itemBuilder:(context,int index){
//          return  product(context,index);
//          },
// )
StreamBuilder(
  stream: Firestore.instance.collection('coffeelist').snapshots(),
  builder: (context,snapshot){
    if(!snapshot.hasData){
    return Text('Loading');}
     else{
      return  ListView.builder(shrinkWrap: true,
          itemCount: snapshot.data.documents.length,
           itemBuilder:(context,int index){
          return  product(context,index,snapshot);
          },
 );

     }


  })
 );
      
  }
}