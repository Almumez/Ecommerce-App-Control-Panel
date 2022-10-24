import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shelhop_admain/Admin_pages/Admin_Delete.dart';
import 'package:shelhop_admain/Admin_pages/MainPageAdmain.dart';
import 'package:shelhop_admain/Admin_pages/Order_Page.dart';
import 'package:shelhop_admain/const/CustomPageRoute.dart';
import 'package:shelhop_admain/const/ErrornInternt.dart';
import 'package:shelhop_admain/verification_phone/LoginController.dart';
import 'package:shelhop_admain/verification_phone/register.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'const/NotAdmin.dart';
String? phone;
var auth = FirebaseAuth.instance;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences share = await  SharedPreferences.getInstance();
   phone = share.getString("phone");
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override

  bool hasInternt=false;

  final loginController = Get.put(LoginController());
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: true,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),

      title: 'shelhop',
      home:
       //hasInternt ==false?ErrorInternt():


      auth.currentUser != null ? MainPageAdmain()
          :Register()
          //:  const Register(),

    );
  }


  @override
  void initState() {
    super.initState();

// InternetConnectionChecker().onStatusChange.listen((status) {
//   bool hasInternt =status ==InternetConnectionStatus.connected;
//   setState(() =>this.hasInternt=hasInternt);
// });

  }

  getmesage(){

    FirebaseMessaging.onMessage.listen((event) {
      Navigator.push(
          context,
          CustomPageRoute(  child: const Order_Page()));
    });
  }
  getTaoken(){

    var Fmc=FirebaseMessaging.instance;
    Fmc.getToken().then((value) => {
      print("======================="),
      print(value),
    print("=======================")
    });
  }
  Open_app_list_order(){
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      Navigator.push(
          context,
          CustomPageRoute(  child: const Order_Page()));

    });

  }
}

