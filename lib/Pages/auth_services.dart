import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:firebase_core/firebase_core.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
bool _isGoogleLoggedIn = false;
/*
Future<String> signInWithGoogle() async {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

  try {
    await _googleSignIn.signIn();
    setState(() {
      _googleSignIn.currentUser != null
          ? _isGoogleLoggedIn = true
          : _isGoogleLoggedIn = false;
    });
  } catch (err) {
    print(err);
  }*/
/*
  final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  // Create a new credential
  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  final UserCredential authResult =
      await _auth.signInWithCredential(credential);
  final User user = authResult.user;
  //final User user = (await _auth.signInWithCredential(credential)).user;

  // Once signed in, return the UserCredential
  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);
  final User currentUser = _auth.currentUser;
  assert(user.uid == currentUser.uid);

  print("Signed in");
  print("Signinwith google succeeded: $user");

  return '$user';

}

Future<void> signOutGoogle() async {
  await googleSignIn.signOut();
  print('User Signed out');
}
*/
