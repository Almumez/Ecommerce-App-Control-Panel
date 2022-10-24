import 'dart:convert';
import 'dart:ui';

import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart'as http;
import '../const/constance.dart';

class Order_Details extends StatefulWidget {
  final  token;
  final  number;
  final urlName;
  final urlImage;
  final note;
  final orderN;
  final Order_Status;
  const Order_Details( {Key? key,required this.Order_Status,required this.token,required this.urlName,required  this.number, required this.urlImage,required this.note,required this.orderN,}) : super(key: key);

  @override
  State<Order_Details> createState() => _Order_DetailsState();
}

class _Order_DetailsState extends State<Order_Details> {
  @override
   int selectValue=1;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: Text('تفاصيل الطلب',style: TextStyle(
          fontWeight: FontWeight.bold,),),
        shadowColor: Colors.white,

      ),
      body:
      SingleChildScrollView(
        child: SafeArea(
          child: Center(



            child: Column(


              children: [

                SizedBox(height: 10,),
                Container(

                  height: 250,
                  width: 400,
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),                  child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: AspectRatio(
                    aspectRatio: 16/9,
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/14.png',
                      image: widget.urlImage,
                      fit: BoxFit.cover,
                      imageErrorBuilder: (context, url, error) => Center(child: Shimmer.fromColors( highlightColor: Colors.white,
                        baseColor: Colors.grey[300]!, child: Container(color: Colors.red),
                      )),
                      fadeInCurve: Curves.bounceIn,
                      height:200,width: 180,
                    ),
                  ),
                ),
                ),
                SizedBox(height: 30,),
                Text(widget.urlName),
                SizedBox(height: 30,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [ Container(
                  height: 100,
                  width: 250,
                  color: primaryColor,
                  child: Text(widget.Order_Status),

                ),Text("-:ملاحظه"),

                 ]),

                SizedBox(height: 30,),
                Row(

              mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:
                [
                  InkWell(onTap: (){
                  sendNatfi("متجر الشلهوب ", "عزيزي الزبون طلبك جاهز يمكنك الان استلام طلبك",widget.token );

                  },child: Text("click")),
                  SizedBox(width: 20,),
                  Text(widget.orderN),
                  Text("-:رقم الطلب"),
                ]),


                SizedBox(height: 50,),
                bulidSocial(),

                Column (
                  textDirection: TextDirection.rtl,
                  children: [
                    Container(padding: EdgeInsets.only(top: 30,left: 200, ),child: Text(" حاله الطلب :-",textDirection: TextDirection.rtl,style: TextStyle(fontSize: 20,),)),
                    Container(

                      padding: EdgeInsets.only(right:10 ),
                      color: Colors.black45,
                      height: 200,
                       margin:  EdgeInsets.only(left: 100,right: 20,bottom: 20,),
                     child: ListView(scrollDirection:Axis.vertical,children: [

                        RadioListTile<int>(
                          value: 1,
                          activeColor: primaryColor,

                          groupValue: selectValue,
                          title: Text("تم استقبال الطلب"),
                          onChanged: (value)=>
                              setState(() {
                                selectValue=value!;
                              })
                          ,

                        ),
                        RadioListTile<int>(
                          value: 2,
                          activeColor: primaryColor,
                          groupValue: selectValue,
                          title: Text("تم البدء في تجهيز الطلب"),
                          onChanged: (value)=>
                              setState(() {
                                selectValue=value!;
                              })
                          ,

                        ),
                        RadioListTile<int>(
                          value: 3,
                          activeColor: primaryColor,

                          title: Text("تم اكمال الطلب"),
                          groupValue: selectValue,
                          onChanged: (value)=>
                              setState(() {
                                selectValue=value!;
                              })
                          ,

                        ),

                      ]),
                    ),
                  ],
                ),





              ],
            ),
          ),
        ),
      ),
    ) ;;
  }

  Widget bulidSocial()=>Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [

      const SizedBox(width: 20,),
      bulidSocialIcon(FontAwesomeIcons.whatsapp,'https://wa.me/${widget.number}?'),
      const SizedBox(width: 20,),
      bulidSocialIcon(FontAwesomeIcons.phone,"tel:+967${widget.number}"),
      const SizedBox(width: 20,),


    ],

  );


  Widget bulidSocialIcon(IconData icon,url)=>Material(
    shape: CircleBorder(),
    clipBehavior: Clip.hardEdge,
    color: Colors.transparent,
    child: CircleAvatar(
      backgroundColor:primaryColor ,
      radius: 25,
      child: InkWell(onTap: ()async{

        await launch(url);

      },child: Center(child: Icon(icon,size: 32,color: Colors.white,),)),
    ),
  );


  void sendNatfi(String titile,String body,String token) async{
    final serverToken="AAAAJSK38VE:APA91bH9JdbbB2E_dneBvypXrvCrDruGdan2c0r5FJLwRPb02h7IQqBQi22_LvSHeuAhmGBes4M-p8-WNXlCLNbsTa13lnf7l8yGS2G8H40TdjqL32R-Ay9WH85PU9ylTGpvGsIJfyJf";
    await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send') ,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverToken',
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{
            'body': body,
            'title': titile
          },
          'priority': 'high',

          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
          },
          'to':token,
        },
      ),
    );

  }
}
