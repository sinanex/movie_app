import 'package:flutter/material.dart';

SnackBar alertsnack({required String text}) {
  return SnackBar(
    duration: Duration(seconds: 1),
    backgroundColor: Color.fromARGB(255, 87, 87, 87),
    margin: EdgeInsets.all(15),
    behavior: SnackBarBehavior.floating,
    content: Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
    ),
  );
}

// To show the snackbar:

