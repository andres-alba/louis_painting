import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'HomePage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Color primaryColor = Color(0xff18203d);
  Color secondaryColor = Color(0xff232c51);
  Color logoGreen = Color(0xff25bcbb);
  String error = '';
  TextEditingController emailcontroller = TextEditingController(text: "");
  TextEditingController passwordcontroller = TextEditingController(text: "");
  bool showProgress = false;
  bool _isGoogleLoggedIn = false;

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

  //final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Color(0xff18203d),
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: Column(children: <Widget>[
              Text(
                "Sign in to Louis' Painting and continue",
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(color: Colors.white, fontSize: 28),
              ),
              SizedBox(height: 20),
              Text(
                "Enter your email and password below to continue to Louis' painting!",
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(color: Colors.white, fontSize: 14),
              ),
              SizedBox(height: 50),
              Container(
                decoration: BoxDecoration(
                  color: secondaryColor,
                  border: Border.all(color: Colors.blue),
                ),
                child: TextField(
                    controller: emailcontroller,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                    ),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(color: Colors.white30),
                        icon: Icon(
                          Icons.account_circle,
                          color: Colors.white,
                        ))),
              ),
              SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  color: secondaryColor,
                  border: Border.all(color: Colors.blue),
                ),
                child: TextField(
                    controller: passwordcontroller,
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
                    obscureText: true,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                        hintText: 'Enter your password',
                        hintStyle: TextStyle(color: Colors.white30),
                        icon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ))),
              ),
              SizedBox(height: 20),
              MaterialButton(
                  elevation: 0,
                  minWidth: double.maxFinite,
                  height: 50,
                  onPressed: () async {
                    final _auth = FirebaseAuth.instance;
                    User user;
                    setState(() {
                      showProgress = true;
                    });

                    try {
                      user = (await _auth.signInWithEmailAndPassword(
                              email: emailcontroller.text.trim(),
                              password: passwordcontroller.text))
                          .user;

                      if (user != null) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                        setState(() {
                          showProgress = false;
                        });
                      }
                    } catch (e) {
                      //inal snackBar = SnackBar(
                      //    content: Text('Por favor escribe la clave correcta'));
                      //Scaffold.of(context).showSnackBar(snackBar);
                      print(e.message);
                      passwordcontroller.text = "";
                    }
                  },
                  color: logoGreen,
                  child: Text('Login',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  textColor: Colors.white),
              SizedBox(height: 20),
              MaterialButton(
                elevation: 0,
                minWidth: double.maxFinite,
                height: 50,
                onPressed: () {
                  var result = _signInWithGoogle();

                  if (result != null) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }
                  /*

                  _signInWithGoogle().then((result) {
                    if (result != null) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return HomePage();
                          },
                        ),
                      );
                    }
                  });*/
                },
                color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(FontAwesomeIcons.google),
                    SizedBox(width: 10),
                    Text('Sign-in using Google',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ],
                ),
                textColor: Colors.white,
              ),
              SizedBox(height: 60),
              _buildFooterLogo()
            ])),
      ),
    );
  }

  _buildFooterLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'images/painting_logo.png',
          height: 80,
        ),
        Text("Louis' Painting",
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
      ],
    );
  }

  _signInWithGoogle() async {
    try {
      await _googleSignIn.signIn();
      setState(() {
        _googleSignIn.currentUser != null
            ? _isGoogleLoggedIn = true
            : _isGoogleLoggedIn = false;
      });
    } catch (err) {
      print(err);
    }
  }

  signOutWithGoogle() {
    _googleSignIn.signOut();
    setState(() {
      _isGoogleLoggedIn = false;
    });
  }
}
