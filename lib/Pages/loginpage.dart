// ignore_for_file: file_names, unused_element, avoid_print, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:spendwise/Pages/entrypage.dart';
import 'package:spendwise/constant/constant.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cc = Colorclass();
    final FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    Future<void> signUpWithGoogle() async {
      try {
        final GoogleSignInAccount? googleSignInAccount =
            await googleSignIn.signIn();
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount!.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);
        print('User signed up with Google: ${userCredential.user}');

        await FirebaseFirestore.instance
            .collection(userCredential.user!.email!)
            .doc(userCredential.user!.uid)
            .set({
          "expense": "0",
          "total": "0",
          "income": "0",
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const EntryPage()),
        );
      } catch (e) {
        print('Sign up with Google failed: $e');
        // Show error message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Sign up with Google failed: $e'),
          ),
        );
      }
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              cc.background_color,
              // cc.container_color,
              cc.white_color
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            color: cc.white_color),
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height / 8,
              right: MediaQuery.of(context).size.width / 6,
              child: Image.asset("assets/Man.png"),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 5.2,
              right: MediaQuery.of(context).size.width / 8,
              child: Image.asset("assets/Donut.png"),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 8,
              right: MediaQuery.of(context).size.width / 1.52,
              child: Image.asset("assets/Coint.png"),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 1.4,
              right: MediaQuery.of(context).size.width / 6.2,
              child: Text(
                "Spend Smarter",
                style: cc.textstyle_green,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 1.32,
              right: MediaQuery.of(context).size.width / 4,
              child: Text(
                "Save More",
                style: cc.textstyle_green,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 1.2,
              right: MediaQuery.of(context).size.width / 4.8,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shadowColor: cc.white_color,
                    elevation: 24,
                    backgroundColor: cc.background_color),
                onPressed: () {
                  signUpWithGoogle();
                },
                child: Text(
                  "Get Started",
                  style: cc.textstyle_button,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
