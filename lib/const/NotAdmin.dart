import 'package:flutter/material.dart';

class NotAdmin extends StatefulWidget {
  const NotAdmin({Key? key}) : super(key: key);

  @override
  State<NotAdmin> createState() => _NotAdminState();
}

class _NotAdminState extends State<NotAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(children: [
          SizedBox(height: 300,),


          Text(" انت لا تملك صلاحيه المشرف يرجئ التواصل مع المشرف ",style: TextStyle(fontSize: 18,),),
          SizedBox(height: 50,),

        ]),
      ),
    );;
  }
}
