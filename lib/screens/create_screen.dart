
import 'package:flutter/material.dart';
import 'package:pinterest_clone/screens/message_screen.dart';
import 'package:pinterest_clone/screens/profile_screen.dart';
import 'package:pinterest_clone/screens/search_screen.dart';
import '../widgets/bottom_navigation_bar.dart';
import 'home_screen.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  int _selectedIndex = 2;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });


    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SearchScreen()),
      );
    }
    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MessageScreen()),
      );
    }
    if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfileScreen()),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: const Center(
          child: Column(
            children: [
              SizedBox(height: 300,),
              Icon(Icons.image,size: 200,color: Colors.white,),
              Text('Start Creating now',style: TextStyle(fontSize: 25,color: Colors.white),)

            ],
          ),
        ),
        bottomNavigationBar: PinterestBottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
