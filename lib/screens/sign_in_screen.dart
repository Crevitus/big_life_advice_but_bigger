import 'package:auth_buttons/auth_buttons.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../config/constants.dart';
import '../config/firebase_options.dart';
import '../res/custom_colors.dart';
import 'admin_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  SignInScreenState createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  Future<User?> _handleSignIn() async {
    final GoogleSignIn googleSignIn =
        GoogleSignIn(clientId: Constants.webClientId);
    final FirebaseAuth auth = FirebaseAuth.instance;

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      return null;
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final User? user = (await auth.signInWithCredential(credential)).user;

    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
                'Sign in to manage big life advice or continue for advice'),
            const SizedBox(height: 20),
            GoogleAuthButton(
              onPressed: () {
                _handleSignIn().then((User? user) {
                  if (user != null) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => AdminScreen(
                          user: user,
                        ),
                      ),
                    );
                  }
                }).catchError((e) {
                  final snackBar = SnackBar(
                    duration: const Duration(seconds: 60),
                    content: Text('Sign in failed: $e'),
                    action: SnackBarAction(
                      label: 'OK',
                      onPressed: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      },
                    ),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                });
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/quotes');
              },
              child: const Text('Continue without signing in'),
            ),
          ],
        ),
      ),
    );
  }
}
