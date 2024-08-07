import 'package:flutter/material.dart';

class PinterestBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const PinterestBottomNavigationBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',backgroundColor: Colors.black),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search',backgroundColor: Colors.black),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Create',backgroundColor: Colors.black),
        BottomNavigationBarItem(icon: Icon(Icons.message_rounded), label: 'messages',backgroundColor: Colors.black),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile',backgroundColor: Colors.black),
      ],
    );
  }
}
