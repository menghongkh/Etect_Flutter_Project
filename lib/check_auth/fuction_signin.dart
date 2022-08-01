import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  final FirebaseAuth auth;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  Stream<User?> get authStateChange => auth.authStateChanges();

  Auth(this.auth);
  var verificationId = '';
  // authentication with google
  Future<void> signInWithGoogle(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);

      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, '/home');
    }
  }

  // Authentication with phone number
  Future<String?> sendOtp(BuildContext context, {required String phone}) async {

    await auth.verifyPhoneNumber(
      timeout: const Duration(seconds: 60),
      phoneNumber: phone,
      codeSent: (String verification, int? resendToken) async {
        verificationId = verification;
      },
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (FirebaseAuthException e) {
        Navigator.pop(context);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        Navigator.pop(context);
      },
    );
  }

  Future<void> login(BuildContext context, {required String OTP}) async {
    try {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: OTP,
      );
      final User user = (await auth.signInWithCredential(credential)).user!;

      if (user.uid.isNotEmpty) {
        Navigator.pushNamed(context, '/auth');
      }
    } catch (e) {
      print(e);
    }
  }

  // logout
  Future<String?> signOut(BuildContext context) async {
    try {
      await auth
          .signOut()
          .whenComplete(() => Navigator.pushNamed(context, '/auth'));

      return "signout".trim().toString();
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
  // email Password

  Future signIn() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passwordcontroller.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      // TODO
      print(e);
    }
  }
}
