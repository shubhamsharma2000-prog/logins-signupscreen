import 'dart:collection';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/login.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SingleChildScrollView(
        child: Container(
        constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height,
    maxWidth: MediaQuery.of(context).size.width,
    ),
    decoration: BoxDecoration(
    color: Colors.lightGreen.shade400,
    ),
    child: Column(


    children: [
    Expanded(child: Padding(
    padding: EdgeInsets.all(20),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,

    children: [
    Text("My Home",style: TextStyle(
    fontWeight:FontWeight.w700,
    fontSize: 46.0,
    color: Colors.white,
    ),),
    Text("Dont loose hope",
    style: TextStyle(color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 20),
    ),
      SizedBox(
        height: 500,
      ),
      ElevatedButton(onPressed: (){
        FirebaseAuth.instance.signOut().then((value) => {
        Navigator.push(context, MaterialPageRoute(builder: (context) => login()))
        });
      }, child: Text("Signup"))
    ],
    ),
    ),
    ),
    ]),
    ),
    ),
    );
  }
}
