import 'package:flutter/material.dart';
import 'package:louis_painting/Pages/setup/loginscreen.dart';
import 'package:louis_painting/Pages/setup/sign_up.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'HomePage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'auth_services.dart';
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
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                    try {
                      FirebaseUser user = (await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: emailcontroller.text,
                                  password: passwordcontroller.text))
                          .user;

                      if (user != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      }
                    } catch (e) {
                      print(e.message);
                      passwordcontroller.text = "";
                    }
                  },

                  /*
                => AuthServices.signIn(
                        emailcontroller.text, passwordcontroller.text)
                    .whenComplete(() => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomePage())))*/
                  color: logoGreen,
                  child: Text('Login',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  textColor: Colors.white),
              SizedBox(height: 20),
              MaterialButton(
                elevation: 0,
                minWidth: double.maxFinite,
                height: 50,
                onPressed: () {},
                /*onPressed: () async {
                  //google sign in
                  final GoogleSignInAccount googleUser =
                      await googleSignIn.signIn();
                  final GoogleSignInAuthentication googleAuth =
                      await googleUser.authentication;

                  final AuthCredential credential =
                      GoogleAuthProvider.getCredential(
                          idToken: googleAuth.idToken,
                          accessToken: googleAuth.accessToken);

                  final FirebaseUser user =
                      (await firebaseAuth.signInWithCredential(credential)).user;
                },*/
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

              /*Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Please type an email';
                        }
                        return null;
                      },
                      onSaved: (input) => _email = input,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          icon: Icon(Icons.email, color: Colors.white),
                          labelStyle: TextStyle(color: Colors.white)),
                    ),
                    TextFormField(
                      validator: (input) {
                        if (input.length < 6) {
                          return "Password needs to be at least 6 characters.";
                        }
                        return null;
                      },
                      onSaved: (input) => _password = input,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.white)),
                      obscureText: true,
                    ),
                    RaisedButton(
                      onPressed: signIn,
                      child: Text('Login'),
                    )
                  ],
                ),
              ),*/
              /*Column(
                children: <Widget>[
                  RaisedButton(
                    onPressed: navigateToSignIn,
                    child: Text('Sign in'),
                  ),
                  RaisedButton(
                    onPressed: navigateToSignUp,
                    child: Text('Sign up'),
                  ),
                ],
              ),*/
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

  void navigateToSignIn() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LoginScreen(), fullscreenDialog: true));
  }

  void navigateToSignUp() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SignUp(), fullscreenDialog: true));
  }

  Future<void> signIn() async {
    try {
      FirebaseUser user = (await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailcontroller.text,
                  password: passwordcontroller.text))
          .user;

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => HomePage(user: user)));
    } catch (e) {
      print(e.message);
    }
  }
}
