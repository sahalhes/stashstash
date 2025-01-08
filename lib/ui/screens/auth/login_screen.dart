import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stashstash/services/auth_service.dart';
import 'package:stashstash/ui/components/loading_indicator.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthService>(
        builder: (context, authService, child) {
          return Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Welcome to StashStash',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton.icon(
                      onPressed: () async {
                        try {
                          await context.read<AuthService>().signInWithGoogle();
                        } catch (e) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Failed to sign in: $e')),
                            );
                          }
                        }
                      },
                      icon: Image.network(
                        'https://www.google.com/favicon.ico',
                        height: 24,
                      ),
                      label: const Text('Sign in with Google'),
                    ),
                  ],
                ),
              ),
              if (authService.isLoading) const LoadingIndicator(),
            ],
          );
        },
      ),
    );
  }
}
