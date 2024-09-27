import 'package:flutter/material.dart';
import 'package:movie/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Row(
            children: [
              Text(
                "Register",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
           Align(
            alignment: Alignment.topLeft,
            child: Text("create your  account  ",
            style: TextStyle(
              fontSize: 15,
              
            ),)),
          const SizedBox(
            height: 60,
          ),
         
          TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_2_outlined),
                label: Text(
                  "username",
                ),
                border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                label: Text('password'),
                border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ))),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Text(
                "already registred?    ",
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text(
                  "Login Here!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
