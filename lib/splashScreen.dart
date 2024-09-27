import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie/home.dart';
import 'package:movie/login.dart';

class Splashscreen extends StatefulWidget {
 
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
void initState() {
  super.initState();
  Future.delayed(Duration(seconds: 3), () {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) =>  LoginPage()),
    );
  });
}

  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
         color: Colors.black,
        ),
        child: const Center(
          child: Text("Movies",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),),
        ),
      ),
      
    );
  }
}