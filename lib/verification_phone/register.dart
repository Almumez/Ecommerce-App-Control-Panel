import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shelhop_admain/const/NotAdmin.dart';


import 'package:shelhop_admain/const/constance.dart';
import 'package:shelhop_admain/verification_phone/LoginController.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../const/CustomPageRoute.dart';
import '../const/Laoding.dart';
import 'otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Register extends StatefulWidget {


  const Register({Key? key}) : super(key: key);


  @override
  _RegisterState createState() => _RegisterState();





}

class _RegisterState extends State<Register> {
  @override
  bool isLodings = false;
  bool isLoding = false;
  final _formKey = GlobalKey<FormState>();
  Icon SuffixIcon = Icon(
    Icons.cancel,
    color: Colors.red,
    size: 32,
  );
  LoginController controller = Get.find();
  final phone = TextEditingController();
  var auth = FirebaseAuth.instance;
  List<String> AdminsNumbers =["776661971"];
  Widget build(BuildContext context) =>
      isLoding ? const Loading()
          : Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Color(0xfff7f6fb),
          body:
          GetMaterialApp(
            home:
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                      ClipPath(
                        clipper:CustomClipperPath(),
                        child:Container(
                          height: 300,
                          width: 500,
                          color: primaryColor ,
                          child: Container(
                              height: 50,
                              width: 50,
                              margin: EdgeInsets.fromLTRB(50, 30, 50, 70),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  child: AspectRatio(
                                    aspectRatio: 16/9,
                                    child: Image.asset(
                                      'assets/14.png',
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ))),
                        )
                      ),


                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 32),
                        child: Column(
                          children: [

                            SizedBox(
                              height: 0,
                            ),
                            Text(
                              'التسجيل',
                              style: TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.none,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 22,
                            ),
                            const Text(
                              "ادخل رقم هاتفك ",
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black38,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 28,
                            ),
                            Container(
                              padding: EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                children: [
                                  Form(
                                    key: _formKey,
                                    child: TextFormField(
                                      onChanged: (value) {
                                        if (value.length == 9) {
                                          setState(() {
                                            SuffixIcon = Icon(
                                                Icons.check_circle,
                                                color: Colors.green,
                                                size: 32
                                            );
                                          });
                                        } else {
                                          setState(() {
                                            SuffixIcon = Icon(
                                                Icons.cancel,
                                                color: Colors.red,
                                                size: 32
                                            );
                                          });
                                        }
                                      },
                                      validator: (value) {
                                        if (value.toString().isEmpty || value.toString().length <= 8)
                                          return "يرجئ التحقق من الرقم المدخل";
                                        return null;
                                      },
                                      maxLength: 9,
                                      controller: phone,
                                      keyboardType: TextInputType.number,
                                      style: TextStyle(
                                        fontSize: 18,

                                        fontWeight: FontWeight.bold,

                                      ),
                                      decoration: InputDecoration(
                                          hintText: "7********",
                                          labelText: "رقم الهاتف",
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.black12),
                                              borderRadius: BorderRadius.circular(10)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.black12),
                                              borderRadius: BorderRadius.circular(10)),
                                          prefix: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8),
                                            child: Text(
                                              '(+967)',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),

                                          suffixIcon: SuffixIcon
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 22,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        print("========================");
                                        print(AdminsNumbers);
                                        print("========================");

                                        if (_formKey.currentState!.validate()&&AdminsNumbers.contains(phone.text)==true) {
                                          setState(() => isLoding = true);
                                          controller.verifyPhone(phone.text,context);
                                          await Future.delayed(const Duration(seconds: 20));
                                          setState(() => isLoding = false);
                                          SharedPreferences share =  await SharedPreferences.getInstance();
                                          share.setString("phone", phone.text);


                                        }
                                        else{
                                          await Navigator.push(
                                              context,
                                              CustomPageRoute(  child:  const NotAdmin()));
                                        }
                                      },
                                      style: ButtonStyle(
                                        foregroundColor:
                                        MaterialStateProperty.all<Color>(Colors.white),
                                        backgroundColor:
                                        MaterialStateProperty.all<Color>(primaryColor),
                                        shape:
                                        MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(24.0),
                                          ),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(14.0),
                                        child: Text(
                                          'التالي',
                                          style: TextStyle(fontSize: 16,
                                            fontWeight: FontWeight.bold,),

                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                ),
              ),
            ),
            ),
          );


  GetNumbersAdmin() async {
    CollectionReference userref =
    FirebaseFirestore.instance.collection("AdminNumbers");
    try {
      var reponsbody = await userref.get();
      reponsbody.docs.forEach((element) {
        setState(() {
       //   print("${element.data["number"]}");
          print("start===========");
        var  number  =   element.data().toString().replaceAll("{Number:", "");
        print(number);
      var  number2=  number.replaceAll("}", "");


          print("end===========");
        });
        setState(() => isLodings = true);
      });

    } catch (e) {
      showTopSnackBar(
          context,
          CustomSnackBar.info(
            message: "يرجئ التاكد من انك متصل في الانترنت",
            backgroundColor: primaryColor,
          ));
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    GetNumbersAdmin();
  }
}

class CustomClipperPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w=size.width;
    double h=size.height;

    Path path0 = Path();
    path0.moveTo(0,0);
    path0.lineTo(0,size.height);
    path0.quadraticBezierTo(size.width*0.3994375,size.height*0.7504400,size.width*0.5189500,size.height*0.8056000);
    path0.quadraticBezierTo(size.width*0.8072625,size.height*1.0144800,size.width,size.height*0.9707400);
    path0.lineTo(size.width,size.height*0.0026600);

    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }



}
