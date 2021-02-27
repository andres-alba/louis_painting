import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        //SafeArea - display widget where it does not disturb clock, wifi icon, etc..
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              color: Colors.blue,
              child: Text('Logout',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              textColor: Colors.white,
              onPressed: () {},
            ),
            CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.white70,
              backgroundImage: AssetImage('images/painting_logo.png'),
            ),
            Text(
              "Loui's Painting",
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.blue,
                fontFamily: 'Pacifico',
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'INTERIOR/EXTERIOR',
              style: TextStyle(
                  color: Colors.teal.shade100,
                  fontSize: 20.0,
                  letterSpacing: 2.5,
                  fontFamily: 'SourceSans'),
            ),
          ],
        ),
      ),
    );
  }
}
