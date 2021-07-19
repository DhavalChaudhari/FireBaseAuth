//import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuth auth = FirebaseAuth.instance;
final googlSignIn = GoogleSignIn;
 //googlSignIn? GoogleSignIn;

 Future googleSignIn() async {
  //GoogleSignInAccount? googleSignInAccount = await googlSignIn.signIn();
GoogleSignInAccount? googleSignInAccount = await googleSignIn().signIn;

  if (googleSignInAccount != null) {
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    UserCredential result = await auth.signInWithCredential(credential);

    User user = auth.currentUser!;
    print(user.uid);

    return Future.value(true);
  }
}
