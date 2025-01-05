import 'package:flutter/material.dart';
import '../components/stash_card.dart';
import '../components/bottom_nav_bar.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StashStash'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 10, // Temporary count
        itemBuilder: (context, index) {
          return const StashCard();
        },
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
