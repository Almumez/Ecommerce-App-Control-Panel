import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:shelhop_admain/Admin_pages/Admin_Delete.dart';

import 'package:shelhop_admain/const/CustomPageRoute.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:get/get.dart';
import 'package:shelhop_admain/Admin_pages/Admin_add.dart';


import '../const/constance.dart';
import 'Order_Page.dart';

class MainPageAdmain extends StatefulWidget {
  const MainPageAdmain({Key? key}) : super(key: key);
  @override
  State<MainPageAdmain> createState() => _MainPageAdmainState();
}

class _MainPageAdmainState extends State<MainPageAdmain> {
  @override
  bool isLoding = false;
  Widget build(BuildContext context) {
    return
      WillPopScope(
        onWillPop: ()async{

      final value=  await  showDialog<bool>(context: context, builder: (context)
          {
            return AlertDialog(
              title: Text("تنبيه"),
              content:  Text("هل انت متاكد من انك تريد الخروج"),
              actions: [
                ElevatedButton(onPressed: ()=>SystemNavigator.pop(), child: Text("خروج")),
                ElevatedButton(onPressed: ()=>Navigator.of(context).pop(false), child: Text("لا"))

              ],
            );


          });
      if(value!=null){
        return Future.value(value);
      }
      else{
        return Future.value(false);
      }
        },

        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            brightness: Brightness.dark,
            backgroundColor: primaryColor,
            title: Text(' Admin مرحبا',style: TextStyle(
              decoration: TextDecoration.none,
              fontWeight: FontWeight.bold,),),
            shadowColor: Colors.white,
          ),
          body: SafeArea(
              child:Stack(
                children: [

                  Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: AspectRatio(
                        aspectRatio: 16/9,
                        child: Image.asset("assets/17.png",fit: BoxFit.fill),
                      ),
                    ),
                  ),

                  Container(
                    padding:EdgeInsets.only(top: 300,left: 10,),
                    child: GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,crossAxisSpacing: 20,mainAxisSpacing: 20,
                    ),

                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(
                                context,
                                  CustomPageRoute(child:  Admin_add()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(15))
                            ),
                            padding: EdgeInsets.only(right: 10,),
                            child: Column(

                              children: [

                                Container(color: Colors.white,
                                  height: 140,width: 200,
                                  child:
                                  Image.asset("assets/10.png",height: 150,fit: BoxFit.cover,),

                                ),SizedBox(height: 7,),

                                Container(

                                  height: 43 ,width:  double.infinity,
                                  decoration: BoxDecoration(border: Border.all(width: 2.0,color:primaryColor),
                                    borderRadius: BorderRadius.all(Radius.circular(20),),color: Colors.white
                                    ,
                                  ),

                                  child: Center(
                                    child: Text("اضافه",style:  TextStyle(
                                      color: primaryColor,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.bold,)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){

                            Navigator.push(
                                context,
                                 new CustomPageRoute(child:  Admin_Delete()));


                          }

                          ,
                          child: Container(

                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(15))
                            ),
                            padding: EdgeInsets.only(right: 10,),
                            child: Column(

                              children: [

                                Container(color: Colors.white,
                                  height: 140,width: 200,
                                  child:
                                  Image.asset("assets/15.png",height: 150,fit: BoxFit.cover,),

                                ),SizedBox(height: 7,),

                                Container(

                                  height: 43 ,width:  double.infinity,
                                  decoration: BoxDecoration(border: Border.all(width: 2.0,color:primaryColor),
                                    borderRadius: BorderRadius.all(Radius.circular(20),),color: Colors.white
                                    ,
                                  ),

                                  child: Center(
                                    child: Text("حذف",style:  TextStyle(
                                      color: primaryColor,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.bold,)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){

                           Navigator.push(
                                context,
                               CustomPageRoute(child: const Order_Page()));

                          }

                          ,
                          child: Container(

                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(15))
                            ),
                            padding: EdgeInsets.only(right: 10,),
                            child: Column(

                              children: [

                                Container(color: Colors.white,
                                  height: 140,width: 200,
                                  child:
                                  Image.asset("assets/list_order.png",height: 150,fit: BoxFit.contain,),

                                ),SizedBox(height: 7,),

                                Container(

                                  height: 43 ,width:  double.infinity,
                                  decoration: BoxDecoration(border: Border.all(width: 2.0,color:primaryColor),
                                    borderRadius: BorderRadius.all(Radius.circular(20),),color: Colors.white
                                    ,
                                  ),

                                  child: Center(
                                    child: Text("عرض قائمه الطلبات",style:  TextStyle(
                                      color: primaryColor,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.bold,)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )












                      ],
                    ),
                  ),



                ],
              )



          ),

        ),
      );

  }

  @override
  void initState() {
    FirebaseMessaging.instance.subscribeToTopic("Admins");
  }
}




