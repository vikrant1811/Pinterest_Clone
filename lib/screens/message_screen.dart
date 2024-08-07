import 'package:flutter/material.dart';
import 'package:pinterest_clone/screens/create_screen.dart';
import 'package:pinterest_clone/screens/profile_screen.dart';
import 'package:pinterest_clone/screens/search_screen.dart';
import '../widgets/bottom_navigation_bar.dart';
import 'home_screen.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  int _selectedIndex = 3;
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
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CreateScreen()),
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
        body:const Center(
          child: Column(
            children: [
              SizedBox(height: 300,),
              Icon(Icons.messenger_outline_sharp,size: 150,color: Colors.white,),
              Text('Meassage Box is empty',style: TextStyle(fontSize: 25,color: Colors.white),)

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
