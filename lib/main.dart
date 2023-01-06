import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'config/firebase_options.dart';
import 'res/custom_colors.dart';
import 'screens/quotes_screen.dart';
import 'screens/sign_in_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const App(),
        '/quotes': (context) => const QuotesScreen(),
      },
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text(
                'Initialisation error, Google sign in unavailable');
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (FirebaseAuth.instance.currentUser != null) {
              return const QuotesScreen();
            } else {
              return const SignInScreen();
            }
          } else {
            return const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                CustomColors.firebaseOrange,
              ),
            );
          }
        });
  }
}
