import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


void main() {
  runApp( MyApp2());
}

class CustomData extends StatefulWidget {

  late FirebaseApp app;
  @override
  _CustomDataState createState() => _CustomDataState();
}

class _CustomDataState extends State<CustomData> {
  final referancedatabase = FirebaseDatabase.instance;
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
                       Navigator.push(context,
                           MaterialPageRoute(builder: (context) => MyApp()));
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


final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class MyApp2 extends StatelessWidget{
  const MyApp2({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //use MaterialApp() widget like this
        home: MyApp() //create new widget class for this 'home' to
      // escape 'No MediaQuery widget found' error
    );
  }
}
class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Column(
        children: [
          Text("Device Width ${MediaQuery.of(context).size.width}"),
          Text("Device Height ${MediaQuery.of(context).size.height}"),

          Text("Welcomee bitch"),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: "Email",
            ),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: "Password",
            ),
          ),
          ElevatedButton(
            onPressed: () {
             emailController.text = "2323";
             Navigator.push(context,
                 MaterialPageRoute(builder: (context) => CustomData()));
            },
            child: Text("Sign in"),
          )
        ],
      ),
    );
  }

}

class Data2 extends StatelessWidget{
  const Data2({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //use MaterialApp() widget like this
        home: Data() //create new widget class for this 'home' to
      // escape 'No MediaQuery widget found' error
    );
  }
}
class Data extends StatelessWidget {
  Data({Key? key}) : super(key: key);
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
              decoration: InputDecoration(labelText: "Username"),
            ),

            TextField(
              controller: passController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(labelText: "password"),
            ),
            Center(
              child: TextButton(

                onPressed: () {
                  if (username.toString() == (userController)) {
                    if (password.toString() == passController) {
                      userController.text = "wooorking";
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
