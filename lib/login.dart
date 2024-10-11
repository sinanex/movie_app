import 'package:flutter/material.dart';
import 'package:movie/home.dart';
import 'package:movie/splashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'WidgetVariable.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

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
            const SizedBox(height: 100),
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
              decoration:  InputDecoration(
                prefixIcon: Icon(Icons.person_outline),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30)
                ),
                label: Text("Username"),
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),

            const SizedBox(height: 30),

            TextField(
              controller: _passwordController,
              style: const TextStyle(color: Colors.white),
              obscureText: true,
              decoration:  InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                labelText: "Password",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(30)
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            OutlinedButton(
              onPressed: () {
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
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't you have an account?"),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/reg');
                    },
                    child: const Text(
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

  Future<void> checkData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key_login, true);
    String? storedId = prefs.getString('userId');
    String? storedPassword = prefs.getString('userPassword');
    String enteredId = _usernameController.text;
    String enteredPassword = _passwordController.text;
    if (enteredId == storedId && enteredPassword == storedPassword) {
      ScaffoldMessenger.of(context)
          .showSnackBar(alertsnack(text: "Login Success"));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(alertsnack(text: "Invalid username and password"));
    }
  }
}
