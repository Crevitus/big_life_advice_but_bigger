import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/app_container.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({Key? key}) : super(key: key);

  @override
  State<QuotesScreen> createState() => QuotesScreenState();
}

class QuotesScreenState extends State<QuotesScreen> {
  final firestore = FirebaseFirestore.instance;

  String _quote = 'Loading quote...';

  @override
  void initState() {
    super.initState();
    _getNewQuote();
  }

   void _getNewQuote() async {
    final snapshot = await firestore.collection('marks').get();

    final random = Random();
    final randomIndex = random.nextInt(snapshot.docs.length - 1);
    final randomQuote = snapshot.docs[randomIndex];

    setState(() {
      _quote = randomQuote.data()['quote'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: _getNewQuote,
              splashColor: Colors.brown.withOpacity(0.5),
              child: Ink(
                height: 400,
                width: 400,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/mark.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            FittedBox(fit: BoxFit.fitWidth, child: Text(_quote)),
          ],
        ),
      ),
    );
  }
}