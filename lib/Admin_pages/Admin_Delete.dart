import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

import 'package:favorite_button/favorite_button.dart';
import '../const/constance.dart';
import 'package:carousel_pro/carousel_pro.dart';
class Admin_Delete extends StatefulWidget {
  const Admin_Delete({Key? key}) : super(key: key);

  @override
  Admin_Deletestat createState() => Admin_Deletestat();
}

class Admin_Deletestat extends State<Admin_Delete> {
  final GlobalKey<ScaffoldState> scaffledkey=GlobalKey<ScaffoldState>();
  var name;
  var imgname;
  var  alart;
  bool isLoding=false;
  List mobile = [];
  CollectionReference userref =
  FirebaseFirestore.instance.collection("باقات ومسكات ورد");
  var Categries=Text(
    "الـمنـتـجـات",
    textDirection: TextDirection.rtl,
    style: TextStyle(
      fontSize: 20,
    ),
  );
  @override

  Widget build(BuildContext context) {
    return
      Scaffold(
        key: scaffledkey,
        appBar: AppBar(
          brightness: Brightness.dark,
          backgroundColor: primaryColor,
          title: Center(child: Text('حذف منتج',style: TextStyle(
            fontWeight: FontWeight.bold,),)
          ),
          shadowColor: Colors.white,
        ),
        body: SafeArea(
          child: ListView(
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
                        child: Container(
                          child: Image.asset(
                            'assets/15.png',
                            fit: BoxFit.cover,
                          ),
                        ))

                ),
              ),


              Container(
                  padding: EdgeInsets.only(top: 20, right: 20),
                  child: Text(
                    "الاقـسـام",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 100,
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        userref = FirebaseFirestore.instance
                            .collection("NEWS");
                        Categries=Text(
                          "جديدنا",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        );
                      });
                    },
                    child: Container(
                      height: 120,
                      width: 120,
                      child: ListTile(
                        title: Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                            child: ClipRRect(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                                child: AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: Image.asset(
                                      'assets/New.png',
                                      fit: BoxFit.cover,
                                    )))),
                        subtitle: Text(
                          "جديدنا",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        userref = FirebaseFirestore.instance
                            .collection("العروض");
                          Categries=Text(
                            "العروض",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          );
                      });
                    },
                    child: Container(
                      height: 120,
                      width: 120,
                      child: ListTile(
                        title: Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                            child: ClipRRect(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                                child: AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: Image.asset(
                                      'assets/discount.png',
                                      fit: BoxFit.cover,
                                    )))),
                        subtitle: Text(
                          "العروض",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        userref = FirebaseFirestore.instance
                            .collection("باقات ومسكات ورد");
                        Categries=Text(
                          "باقات ومسكات ورد",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        );
                      });
                    },
                    child: Container(
                      height: 120,
                      width: 120,
                      child: ListTile(
                        title: Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                            child: ClipRRect(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                                child: AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: Image.asset(
                                      'assets/flower.jpg',
                                      fit: BoxFit.cover,
                                    )))),
                        subtitle: Text(
                          "باقات ومسكات ورد",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        userref = FirebaseFirestore.instance
                            .collection("بـاقات شوكلاته");
                        Categries=Text(
                          "بـاقات شوكلاته",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        );
                      });
                    },
                    child: Container(
                      height: 120,
                      width: 120,
                      child: ListTile(
                        title: Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                            child: ClipRRect(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                                child: AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: Image.asset(
                                      'assets/package.png',
                                      fit: BoxFit.cover,
                                    )))),
                        subtitle: Text(
                          "بـاقات شوكلاته",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        userref = FirebaseFirestore.instance
                            .collection("باقات ميك اب");
                        Categries=Text(
                          "باقات ميك اب",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        );
                      });
                    },
                    child: Container(
                      height: 120,
                      width: 120,
                      child: ListTile(
                        title: Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                            child: ClipRRect(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                                child: AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: Image.asset(
                                      'assets/make-up.jpg',
                                      fit: BoxFit.cover,
                                    )))),
                        subtitle: Text(
                          "باقات ميك اب",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        userref =
                            FirebaseFirestore.instance.collection("نحت وخط");

                        Categries=Text(
                          "نحت وخط",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        );
                      });
                    },
                    child: Container(
                      height: 120,
                      width: 120,
                      child: ListTile(
                        title: Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                            child: ClipRRect(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                                child: AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: Image.asset(
                                      'assets/font_gift.jpg',
                                      fit: BoxFit.cover,
                                    )))),
                        subtitle: Text(
                          "نحت وخط",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        userref = FirebaseFirestore.instance
                            .collection("تحف وهدايا واكسوارات");
                        Categries=Text(
                          "تحف وهدايا واكسوارات",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        );
                      });
                    },
                    child: Container(
                      height: 120,
                      width: 120,
                      child: ListTile(
                        title: Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                            child: ClipRRect(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                                child: AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: Image.asset(
                                      'assets/antiques.jpg',
                                      fit: BoxFit.cover,
                                    )))),
                        subtitle: Text(
                          "تحف وهدايا واكسوارات",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              Container(
                  padding: EdgeInsets.only(top: 20, right: 20),
                  child: Categries),
              StreamBuilder <QuerySnapshot>(stream: userref.snapshots(),builder: (context,snapshot){
                if(snapshot.hasData){
                  return Container(
                    height: 550,
                    child: GridView.builder(
                        padding: EdgeInsets.all(20),
                        itemCount: snapshot.data!.docs.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                        ),
                        itemBuilder: (context, i) {
                          return InkWell(
                            onTap: (){
                              showTopSnackBar(
                                  context,
                                  CustomSnackBar.success(
                                    message:
                                    "يرجئ الضغط باستمرار من اجل حذف صنف",backgroundColor: primaryColor,
                                  ));
                            },onLongPress: (){

                            showDialog(context: context,barrierDismissible: false, builder:(context)=> alart =   AlertDialog(
                           actionsAlignment: MainAxisAlignment.center,
                              backgroundColor: Colors.white,
                              title: const Center(
                                child: Text("  !هل  تريد حذف هاذا الصنف ",style:
                                TextStyle(fontWeight: FontWeight.w400,)),
                              ),
                              actions: [
                                FlatButton(onPressed: () async{
                                  await   userref.doc(snapshot.data!.docs[i].id).delete();
                                  showTopSnackBar(
                                    context,
                                    CustomSnackBar.success(
                                      message:
                                      "تم الحذف بنجاح",backgroundColor: primaryColor,
                                    ),
                                  );
                                  Navigator.pop(context);


                                }, child: Text("حذف"),color:primaryColor),
                                FlatButton(onPressed: (){Navigator.pop(context);}, child: Text("الغاء"),color: Colors.grey[300]
                                ),

                              ],


                            ),
                            );
                          },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                child: AspectRatio(
                                  aspectRatio: 16/9,
                                  child: Stack(
                                    children: [
                                      FadeInImage.assetNetwork(
                                        placeholder: 'assets/loading.png',
                                        image: "${snapshot.data!.docs[i]["imgurl"]}",
                                        fit: BoxFit.cover,
                                        fadeInCurve: Curves.bounceIn,
                                        height:200,width: 180,


                                    imageErrorBuilder: (context, url, error) => Center(child: Shimmer.fromColors( highlightColor: Colors.white,
                                      baseColor: Colors.grey[300]!, child: Container(color: Colors.red),
                                    )),





                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  );
                }

                if(snapshot.connectionState == ConnectionState.waiting){
                  return Shimmer.fromColors(
                    highlightColor: Colors.white,
                    baseColor: Colors.grey[300]!,
                    child: Container(
                      padding:EdgeInsets.only(top: 250) ,
                      child:GridView.builder(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2) ,itemCount: 10,itemBuilder: (context ,index){
                        return Container(color: Colors.grey[300]!,);

                      },),
                    ),
                  );
                }

                if(snapshot.hasError){
                  {showTopSnackBar(
                      context,
                      CustomSnackBar.success(
                        message:
                        "يرجئ التحقق من اتصالك في الانترنت",backgroundColor: primaryColor,
                      ));
                  }}
                return Text("ok");
              }, ),
            ],
          ),

        ),
      );



  }

  
}
