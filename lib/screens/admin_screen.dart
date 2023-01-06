import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/app_container.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key, required User user}) : super(key: key);

  @override
  AdminScreenState createState() => AdminScreenState();
}

class AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return const AppContainer(
      body: Center(
        child: Text('Admin screen'),
      ),
    );
  }
}