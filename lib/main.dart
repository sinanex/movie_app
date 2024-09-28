import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie/splashScreen.dart';
import 'login.dart';

void main() {
  runApp(MyApp());

  // Ensure the status bar is visible
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
      overlays: [SystemUiOverlay.top]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Splashscreen(),
    );
  }
}
