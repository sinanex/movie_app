import 'package:flutter/material.dart';
import 'package:movie/home.dart'; 
import 'package:movie/register.dart';
import 'package:movie/splashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart'; 
import 'WidgetVariable.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            SizedBox(height: 100),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: const Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 50),

            // Username TextField
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline),
                border: OutlineInputBorder(),
                label: Text("Username"),
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),

            const SizedBox(height: 30),

            // Password TextField
            TextField(
              controller:
                  _passwordController, // Use the password controller here
              style: const TextStyle(color: Colors.white),
              obscureText: true, // Mask the password input
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                labelText: "Password",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 30,
            ),

// Space before button
            OutlinedButton(
              onPressed: () {
                checkLogin(context);
                checkData();
              },
              child: const Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't you have an account?"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                    },
                    child: Text(
                      "Sign up Here!",
                      style: TextStyle(color: Colors.red),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void checkLogin(BuildContext context) {
    String username = "sinan";
    String password = "sinan";

    if (_usernameController.text == username &&
        _passwordController.text == password) {
                  ScaffoldMessenger.of(context).showSnackBar(alertsnack(text: "Login success"));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),

      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
       alertsnack(text: "Invalid username and password"),
      );
    }
  }
  
  Future<void> checkData()async {
    SharedPreferences _checkData = await SharedPreferences.getInstance();
_checkData.setBool(key_login,true);
  }
}
