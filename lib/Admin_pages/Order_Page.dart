import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shelhop_admain/Admin_pages/Order_Details.dart';
import 'package:shimmer/shimmer.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../const/CustomPageRoute.dart';
import '../const/constance.dart';

class Order_Page extends StatefulWidget {
  const Order_Page({Key? key}) : super(key: key);

  @override
  State<Order_Page> createState() => _Order_PageState();
}



var userref = FirebaseFirestore.instance.collection("قائمه الطلبات").orderBy("Date_Order",descending: true);
 var userDelete=FirebaseFirestore.instance.collection("قائمه الطلبات");
late String numberPhone;
class _Order_PageState extends State<Order_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: primaryColor,
        title: Center(child: Text('قائمه الطلبات',style: TextStyle(
          fontWeight: FontWeight.bold,),)
        ),
        shadowColor: Colors.white,
      ),
       body:  StreamBuilder <QuerySnapshot?>(stream: userref.snapshots(),builder: (context,snapshot){

         if(snapshot.hasData ){

           return ListView.builder(itemCount: snapshot.data!.docs.length,itemBuilder: (context, i){
             return ListTile(
               leading: CircleAvatar(
                 radius: 28,
                 backgroundColor: primaryColor,
                 backgroundImage: NetworkImage("${snapshot.data!.docs[i]["imgurl"]}"),
               ),

               title: Text("${snapshot.data!.docs[i]["note"]}"),
               subtitle: Text("${snapshot.data!.docs[i]["OrderN"]}"),
               trailing: InkWell(
                   onTap: ()async{
                     await   userDelete.doc(snapshot.data!.docs[i].id).delete();
                     showTopSnackBar(
                         context,
                         CustomSnackBar.success(
                           message:
                           "تم الحذف من قائمه الطلبات بنجاح",backgroundColor: primaryColor,
                         ));

                   },
                   child: Icon(Icons.delete)),


               onTap: (){
                 Navigator.push(
                     context,
                     CustomPageRoute(child: Order_Details(urlImage:"${snapshot.data!.docs[i]["imgurl"]}", urlName: "${snapshot.data!.docs[i]["name"]}", number: "${snapshot.data!.docs[i]["phoneNumber"]}", orderN: "${snapshot.data!.docs[i]["OrderN"]}", note: "${snapshot.data!.docs[i]["note"]}", token: "${snapshot.data!.docs[i]["token"]}", Order_Status: "${snapshot.data!.docs[i]["Order_Status"]}",)));

               },
             );




           },);


         }

         if(snapshot.connectionState == ConnectionState.waiting){
           return ListView.builder(
             itemCount: 50,itemBuilder: (context, i){
             return Shimmer.fromColors(
               highlightColor: Colors.white,
               baseColor: Colors.grey[300]!,
               child: ListTile(
                 leading: CircleAvatar(
                   radius: 28,
                   backgroundColor: primaryColor,
                   backgroundImage:
                   AssetImage(''),
                 ),

                 title: Text("جاري التحميل "),
                 subtitle: Text("جاري التحميل"),



                 onTap: (){
                   Navigator.push(
                       context,
                       CustomPageRoute(child:  Order_Details(urlImage:"${snapshot.data!.docs[i]["imgurl"]}", urlName: "${snapshot.data!.docs[i]["name"]}", number: "${snapshot.data!.docs[i]["phoneNumber"]}", orderN: "${snapshot.data!.docs[i]["OrderN"]}", note: "${snapshot.data!.docs[i]["note"]}", token: "${snapshot.data!.docs[i]["token"]}",Order_Status: "${snapshot.data!.docs[i]["Order_Status"]}")));

                 },
               ),
             );




           },);

         }
         if(!snapshot.hasData){
           return Text("data");
         }
         
         if(snapshot.hasError){
           {showTopSnackBar(
               context,
               CustomSnackBar.success(
                 message:
                 "يرجئ التحقق من اتصالك في الانترنت",backgroundColor: primaryColor,
               ));
           }}
         else{
           return Shimmer.fromColors(
             highlightColor: Colors.white,
             baseColor: Colors.grey[300]!,
             child: ListView.builder(itemCount: snapshot.data!.docs.length,itemBuilder: (context, i){
               return ListTile(
                 leading: CircleAvatar(
                   radius: 28,
                   backgroundColor: primaryColor,
                   backgroundImage: NetworkImage("${snapshot.data!.docs[i]["imgurl"]}"),
                 ),

                 title: Text("${snapshot.data!.docs[i]["name"]}"),
                 subtitle: Text("${snapshot.data!.docs[i]["OrderN"]}"),
               );

             },),
           );
         }
         return Shimmer.fromColors(
           highlightColor: Colors.white,
           baseColor: Colors.grey[300]!,
           child: ListView.builder(reverse: true,itemCount: snapshot.data!.docs.length,itemBuilder: (context, i){
             return ListTile(
               leading: CircleAvatar(
                 radius: 28,
                 backgroundColor: primaryColor,
                 backgroundImage: NetworkImage("${snapshot.data!.docs[i]["imgurl"]}"),
               ),

               title: Text("${snapshot.data!.docs[i]["name"]}"),
               subtitle: Text("${snapshot.data!.docs[i]["OrderN"]}"),
             );

           },),
         );
       }, ),

    );
  }
}
