// import 'package:comestore/models/UserModel.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class UserAuth {
//   Future State() async {
//     await FirebaseAuth.instance.authStateChanges().listen((User? user) {
//       if (user == null) {
//         print(
//             'User is currently signed out!=======================================');
//       } else {
//         print(
//             'User is signed in!==================================================');
//       }
//     });
//   }

//   Future? Register(UserModel user) async {
//     try {
//       final credential =
//           await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: user.email!,
//         password: user.passowrd,
//       );
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
// }
