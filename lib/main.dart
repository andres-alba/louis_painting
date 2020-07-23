import 'package:flutter/material.dart';
import 'mainscreen.dart';

void main() {
  runApp(MyApp());
}

// invoice
// Invoice for:
// Company Name
// company address
// due date
// project name
// invoice number
// Payable to :
// description
// qty
// unit price
// total price

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Loui's Painting",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}
