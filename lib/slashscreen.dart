

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/main.dart';

class splashscreen extends StatefulWidget
{
  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return MyHomePage();
    }));});

  }
  @override
  Widget build(BuildContext context) {
   return Container(
     height: double.infinity,
     width: double.infinity,
     color: Colors.blue.shade200,
       child: Center(
         child: CircleAvatar(
           radius: 200,
           backgroundColor: Colors.blue.shade200,
           backgroundImage: AssetImage('assets/splashScreen.png'),

         ),
       ),
   );
  }
}