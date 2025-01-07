import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stashstash/ui/screens/auth/login_screen.dart';
import 'package:stashstash/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:stashstash/services/auth_service.dart';
import 'package:stashstash/ui/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: const StashStashApp(),
    ),
  );
}

class StashStashApp extends StatelessWidget {
  const StashStashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StashStash',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: Consumer<AuthService>(
        builder: (context, authService, child) {
          if (authService.currentUser != null) {
            return const HomeScreen();
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
