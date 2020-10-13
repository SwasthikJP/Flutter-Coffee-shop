

import 'package:coffeeapp1/constants.dart';
import 'package:coffeeapp1/totalcost.dart';
import 'package:flutter/material.dart';
import 'package:coffeeapp1/homepage.dart';
//List<bool> firstpress=FirstPress.firstpress;
List<int> firstpressindex=FirstPress.firstpressindex;
//List<int> costforcoffee1=Totalprice.costforcoffee;
//int totalprice1=Totalprice.totalprice=40;

//List<CoffeeList> productList=FirstPress.productList;


class Cart extends StatefulWidget {

 //final List<CartItem> myCart;


 // Cart(this.myCart);
   Cart();
  _CartState createState() => _CartState();
}



class _CartState extends State<Cart> {
 
 // List<CartItem> myCart;
//_CartState(this.myCart);

   
  
  

    
  _CartState();
   
  GlobalKey<AnimatedListState> cartkey=GlobalKey();
   //List <bool> totalpricepress=[true,true,true,true,true,true,true,true,true,true,true,true,];
  
Future<void> gotocart(context)async{
 
for (var i = 0; i < coffeeName1.length; i++) {
   if(totalpricepress==true){
   int p=0; 
  p=coffeeCost1[i]*n1[i];
  costforcoffee.add(p);
totalprice=(totalprice+costforcoffee[i]);
print('$totalprice');
}
}
 totalpricepress=false;
if(coffeeImage1.length!=0){
   Navigator.pushNamed(context, totalcost);

}
 }


  Widget build(BuildContext context) {
 

 
    return Scaffold(
      appBar:AppBar(title: Text('My Cart',style: TextStyle(color: Colors.orange[600],fontStyle: FontStyle.italic),),
      backgroundColor: Colors.brown,),
      body:
 //       ListView.builder(
   //     itemCount: coffeeName1.length,
     //   itemBuilder: (context,index){
       //  return mycart(context, index);
       // }),
          AnimatedList(initialItemCount:n1.length,
          key: cartkey,
          itemBuilder: (context,index,animation){
          
             return mycart(context,index,coffeeName1[index],coffeeImage1[index],coffeeCost1[index],n1[index],isSelected1[index],animation);

          }),
       // floatingActionButton: Text('Place Order',style:TextStyle(backgroundColor: Colors.orange[600],color: Colors.white,),),
        //floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked ,
        bottomNavigationBar: BottomAppBar(
          color: Colors.brown,
          shape: CircularNotchedRectangle(),
          child: Container(height:60,padding: EdgeInsets.all(10),
          child:FlatButton(onPressed: (){
           gotocart(context);
          },color: Colors.orange[600],child:  
          Text('Place Order',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20,),textAlign: TextAlign.center),),
          
      ),  ),
      

    );
    
  
  }
  Widget mycart(BuildContext context,int index,String coffeeName1,String coffeeImage1,int coffeeCost1,int n1,String isSelected1,Animation animation){

 


 return SizeTransition(sizeFactor: animation,
  child:Card(
     child: ListTile(
        leading: Image.asset(coffeeImage1,fit: BoxFit.fill,),
        title: Text(coffeeName1,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.brown),),
        subtitle: Text('Rs.$coffeeCost1        Quantity:$n1     $isSelected1',style: TextStyle(color: Colors.black,backgroundColor: Colors.white),),
        isThreeLine: true,
        trailing:FlatButton.icon(onPressed: (){
    
        removeitem(index);
        }, icon:Icon(Icons.delete), label:Text('REMOVE'),color: Colors.brown,textColor: Colors.white,)

        
      )
      ),
      
      );
 }
 void removeitem(int index){


   int pressindex=firstpressindex[index];
     firstpress[pressindex]=true;
    //  productList[pressindex].n=1;
 //productList[pressindex].isSelected=[true,false];
 productList=[];
 
     firstpressindex.removeAt(index);
 String coffeename=coffeeName1.removeAt(index);
 String coffeeimage=coffeeImage1.removeAt(index);
 int coffeecost=coffeeCost1.removeAt(index);
 int n=n1.removeAt(index);
 String isSelected=isSelected1.removeAt(index);
 //isSelected1.removeAt(index);


 
 
 AnimatedListRemovedItemBuilder builder=(context,animation){
return mycart(context,index,coffeename,coffeeimage,coffeecost,n,isSelected,animation);
 };
 cartkey.currentState.removeItem(index, builder);
costforcoffee=[];

   if(coffeeName1.length!=0){ totalprice=40;

print('$totalprice');
 totalpricepress=true;
   }
 
}
 
}