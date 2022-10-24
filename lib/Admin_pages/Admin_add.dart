import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:image_picker/image_picker.dart';

import '../const/Laoding.dart';
import '../const/constance.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Admin_add extends StatefulWidget {
  const Admin_add({Key? key}) : super(key: key);
  @override
  Admin_addstat createState() => Admin_addstat();
}

class Admin_addstat extends State<Admin_add> {
  @override
  final _formKey = GlobalKey<FormState>();
  var image;
  var textfild;
  final name = TextEditingController();
  late File file= image;
  var imgPicker= ImagePicker();
  var imgname;
  var urlimg;
  var host;
  var tex= Text("اختار نوع المنتج");
  bool isLoding = false;
  Widget build(BuildContext context)  =>
      isLoding ? const Loading()
          :
       Scaffold(
       appBar: AppBar(
         centerTitle: true,
         backgroundColor: primaryColor,
         title: Text('أضـافــه',style: TextStyle(
           fontWeight: FontWeight.bold,),),
         shadowColor: Colors.white,
       ),
      backgroundColor: Colors.white,

        body: SingleChildScrollView(
          child: Column(
            children:
            [
              SizedBox(
                height: 20,
              ),
              Text("اضغط لاختيار صوره"),

              Container(
                  width: 150,
                  height: 150,
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  decoration: BoxDecoration(
                      color: Colors.grey,

                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),

    child: ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    child: AspectRatio(
    aspectRatio: 16/9,
                child:
                InkWell(
                  onTap:()async{
                    await selectimg(context);
                  } ,
                  child: file==null ? image=  Image.asset(
                    'assets/16.png',
                    height: 200,
                    fit: BoxFit.cover,
                  ):Image.file(file,height: 150,fit: BoxFit.cover,),
                ),
              ))),

              SizedBox(
                height: 50,
              ),


              Padding(
                padding: const EdgeInsets.all(50),
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: textfild = TextFormField(
                           controller: name,
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          validator: (value){
                            if(host==null){
                              showTopSnackBar(
                                  context,
                                  CustomSnackBar.info(
                                    message:
                                    "يرجئ التاكد من انه تم تحديد نوع المنتج",backgroundColor: primaryColor,
                                  ));
                            }
                             if(value.toString().isEmpty)
                                 return "يرجئ التاكد من انك ادخلت اسم المنتج";
                                 return null;

                          },
                          decoration: InputDecoration(
                              hintText: "باقه ورد احمر",
                              labelText: "اسم المنتج",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(10)),
                              prefix: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                              ),

                          ),
                        ),
                    ),
                    SizedBox(
                      height: 35,
                    ),

                    DropdownButton(items: [
                      DropdownMenuItem(child: Text("باقات شكولاته"),value: "بـاقات شوكلاته",),
                      DropdownMenuItem(child: Text("باقات ومسكات ورد"),value: "باقات ومسكات ورد",),
                      DropdownMenuItem(child: Text("باقات ميك اب"),value: "باقات ميك اب",),
                      DropdownMenuItem(child: Text("نحت وخط"),value: "نحت وخط",),
                      DropdownMenuItem(child: Text("تحف وهدايا واكسوارات"),value: "تحف وهدايا واكسوارات",),
                      DropdownMenuItem(child: Text("العروض"),value: "العروض",)
                    ], onChanged:(val){
                      setState(() {
                        tex= Text("$val");
                        host=val;
                      }

                      );
                    },
                      hint: tex,

                    ),

                    SizedBox(
                      height: 35,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: ()async  {
                          if(_formKey.currentState!.validate()&&host!=null) {
                            setState(() => isLoding = true);
                            uploadfirebase(context);
                            await Future.delayed(const Duration(seconds: 10));
                            setState(() => isLoding = false);
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
                            'أضافه',
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


    );


  selectimg(context) async {
    var imgpiced= await imgPicker.getImage(source:ImageSource.gallery );
    if(imgpiced!=null){
      setState(() {
        file=File(imgpiced.path);
        imgname=basename(imgpiced.path);
      });

    }else{
      showTopSnackBar(
          context,
          CustomSnackBar.info(
            message:
            "لم يتم اختيار صوره ",backgroundColor: primaryColor),
          );

    }

  }


  uploadfirebase(context)async{
try {
  var restored = FirebaseStorage.instance.ref("$host/$imgname");
  await restored.putFile(file);
  var url = await restored.getDownloadURL();
  urlimg = url;
  var namep = name.text;
  CollectionReference Collection = FirebaseFirestore.instance.collection("$host");
  CollectionReference CollectionNEW = FirebaseFirestore.instance.collection("NEWS");
  if(host=="العروض"){
    await Collection.add(
        {
          "imgurl": "$urlimg",
        });

    showTopSnackBar(
        context,
        CustomSnackBar.success(
          message:
          "تم الاضافه بنجاح",backgroundColor: primaryColor,
        ));
  }else{
    await Collection.add(
      {
        "imgurl": "$urlimg",
        "name":namep,
        "entery_date":DateTime.now().toString()
      });
    await CollectionNEW.add(
        {
          "imgurl": "$urlimg",
          "name":namep,
          "entery_date":DateTime.now().toString()
        });
    showTopSnackBar(
        context,
        CustomSnackBar.success(
          message:
          "تم الاضافه بنجاح",backgroundColor: primaryColor,
        ));
    setState(() {
      file==null;
    });




  }

}
catch(e){
  showTopSnackBar(
      context,
      CustomSnackBar.info(
        message:
        "يرجئ التاكد من انك متصل في الانترنت",backgroundColor: primaryColor,
      ));
}
}

}


