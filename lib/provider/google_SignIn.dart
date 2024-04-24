import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user =>_user!;

  Future googleLogin()async{
    await googleSignIn.signOut();

    final googleUser = await googleSignIn.signIn();
    if (googleUser == null)return;


    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    _user = googleUser;

    notifyListeners();
  }
}
