import 'package:comestore/models/UserModel.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:comestore/pages/HomePage.dart';
import 'package:comestore/pages/LoginPage.dart';
import 'package:comestore/widgets/CusttomDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserAuth {
  Future State() async {
    await FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print(
            'User is currently signed out!=======================================');
      } else {
        print(
            'User is signed in!==================================================');
      }
    });
  }

  Future? Register(UserModel user) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.passowrd,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> Login(UserModel user, context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: user.email, password: user.passowrd);
      if (credential.user!.emailVerified) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return CusttomDialog(
                color: Colors.red,
                title: "خـــطــاء",
                icon: Icons.warning,
                Message:
                    "الرجاء التاكد من بريدك ارسلنا لك رابط التحق الى ${FirebaseAuth.instance.currentUser!.email}",
              );
            });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CusttomDialog(
              icon: Icons.warning,
              title: "خــطـــاء",
              Message: "البريد الإلكتروني او كلمة المرور غير صحيحة",
              color: Colors.red,
            );
          },
        );
      }
    }
  }

  SendEmailVerify() {
    FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  Future signInWithGoogle(context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      return;
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
  }

  ResetPassowrd({required String email, context}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CusttomDialog(
            icon: Icons.check_circle,
            title: "تـنبية",
            Message:
                "الرجاء التحقق من بريدك ارسلنا لك رابط اعادة تعيين كلمة المرور",
            color: Colors.green,
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CusttomDialog(
            icon: Icons.warning,
            title: "خــــطــاء",
            Message: "البريد الذي ادخلتة غير صحيح الرجاء ادخال بريد صحيح",
            color: Colors.red,
          );
        },
      );
    }
  }
}
