import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/search_screen.dart';
import '../screens/create_screen.dart';
import '../screens/saved_screen.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline),
          label: 'Create',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_border),
          label: 'Saved',
        ),
      ],
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        final screens = [
          const HomeScreen(),
          const SearchScreen(),
          const CreateScreen(),
          const SavedScreen(),
        ];

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => screens[index]),
        );
      },
    );
  }
}
