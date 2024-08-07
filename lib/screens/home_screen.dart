import 'package:flutter/material.dart';
import 'package:pinterest_clone/screens/create_screen.dart';
import 'package:pinterest_clone/screens/message_screen.dart';
import 'package:pinterest_clone/screens/search_screen.dart';
import '../widgets/pinterest_card.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../services/api_service.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _page = 1;
  final int _perPage = 20;
  final List<String> _images = [];
  bool _isLoading = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchImages();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _fetchMoreImages();
      }
    });
  }

  void _fetchImages() async {
    setState(() {
      _isLoading = true;
    });
    List<String> images = await ApiService().fetchImages(_page, _perPage);
    setState(() {
      _images.addAll(images);
      _isLoading = false;
    });
  }

  void _fetchMoreImages() async {
    setState(() {
      _page++;
    });
    _fetchImages();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

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
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text('All',style: TextStyle(color: Colors.white),),
        ),
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  if (index == _images.length) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final imageUrl = _images[index];
                  final isOddIndex = index.isOdd;
      
                  return Transform.translate(
                    offset: Offset(
                      isOddIndex ? 0 : 5, // Slightly shift images in the left column
                      isOddIndex ? 0 : 50, // Slightly shift images in the right column
                    ),
                    child: PinterestCard(imageUrl: imageUrl),
                  );
                },
                childCount: _images.length + (_isLoading ? 1 : 0),
              ),
            ),
            if (_isLoading)
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Center(child: CircularProgressIndicator()),
                ),
              ),
          ],
        ),
        bottomNavigationBar: PinterestBottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
