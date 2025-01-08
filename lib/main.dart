import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:provider/provider.dart';
import 'package:stashstash/firebase_options.dart';
import 'package:stashstash/services/auth_service.dart';
import 'package:stashstash/ui/screens/auth/login_screen.dart';
import 'package:stashstash/ui/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize Supabase
  await Supabase.initialize(
    url: const String.fromEnvironment('SUPABASE_URL'),
    anonKey: const String.fromEnvironment('SUPABASE_ANON_KEY'),
  );

  runApp(
    ChangeNotifierProvider(
      create: (_) => AuthService(),
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
      ),
      home: Consumer<AuthService>(
        builder: (context, auth, _) {
          if (auth.isLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          return auth.currentUser != null
              ? const HomeScreen()
              : const LoginScreen();
        },
      ),
    );
  }
}
