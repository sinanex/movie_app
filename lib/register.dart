import 'package:flutter/material.dart';
import 'package:movie/home.dart';
import 'package:movie/login.dart';
import 'package:movie/splashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'WidgetVariable.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _registerUser = TextEditingController();
  final TextEditingController _registerPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          const SizedBox(
            height: 120,
          ),
          const Row(
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
          const SizedBox(
            height: 20,
          ),
          const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "create your account  ",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              )),
          const SizedBox(
            height: 60,
          ),
          TextField(
            controller: _registerUser,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_2_outlined),
                label: Text(
                  "username",
                ),
                border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 30,
          ),
          TextField(
            controller: _registerPass,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                label: Text('password'),
                border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () {
                    CheckLog();
                  },
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
  

    Future<void> CheckLog() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
  

  String id = _registerUser.text;
  String password = _registerPass.text;



     if (id.isNotEmpty && password.isNotEmpty) {
      await _pref.setString('userId', id);
      await _pref.setString('userPassword', password);
      ScaffoldMessenger.of(context).showSnackBar(alertsnack(text: "Registration Success"));
       Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    } else {
      print("erorr");
      ScaffoldMessenger.of(context).showSnackBar(alertsnack(text: "invalid username and password"));
    }
  }
          
  }
  

  
  
