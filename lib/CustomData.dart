import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_core/firebase_core.dart';
import '../android/app/firebase_options.dart';


class CustomData extends StatefulWidget {
  CustomData(this.app);
   final Firebase app;

  @override
  _CustomDataState createState() => _CustomDataState();
}

class _CustomDataState extends State<CustomData> {
  FirebaseDatabase referancedatabase = FirebaseDatabase.instance;
  @override
  Widget build(BuildContext context) {
    final ref = referancedatabase.reference();

    final userController = TextEditingController();
    final passController = TextEditingController();

    final username = ref.child("users").orderByChild("username");
    final password = ref.child("users").orderByChild("password");
    return Scaffold(
      appBar: AppBar(title: Text("Hi"),),
      body: SingleChildScrollView(
        child: Column(

          children: [

            TextField(
              controller: userController,
              textAlign: TextAlign.center,
              decoration: InputDecoration( labelText: "Username"),
            ),

            TextField(
              controller: passController,
              textAlign: TextAlign.center,
              decoration: InputDecoration( labelText: "password"),
            ),
            Center(
              child: TextButton(

                onPressed: () {
                  if (username.toString() == (userController)){
                    if (password.toString() == passController){
                     setState(() {
                       userController.text = "wooorking";
                     });
                    }
                  }


                }, child: Text("Continue"),

              ),
            )
          ],
        ),
      ),

    );

  }
}

