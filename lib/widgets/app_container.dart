import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../config/constants.dart';

class AppContainer extends StatefulWidget {
  final Widget body;

  const AppContainer({super.key, required this.body});

  @override
  State<AppContainer> createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  final GoogleSignIn googleSignIn =
      GoogleSignIn(clientId: Constants.webClientId);
  final FirebaseAuth auth = FirebaseAuth.instance;

  User? user;

  @override
  void initState() {
    super.initState();
    if (auth.currentUser != null) {
      setState(() {
        user = auth.currentUser;
      });
    }
  }

  Future<void> _signOut() async {
    await auth.signOut();
    await googleSignIn.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Big Life Advice'),
        actions: user != null ? [
          PopupMenuButton(
            icon: ClipOval(
                    child: Image.network(
                    user!.photoURL!,
                    width: 96,
                    fit: BoxFit.cover,
                  )),
            onSelected: (value) {
              if (value == 'signOut') {
                _signOut();
                Navigator.of(context).pushReplacementNamed('/');
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'signOut',
                child: Text('Sign out'),
              ),
            ],
          ),
        ] : null,
      ),
      body: widget.body,
    );
  }
}
