import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:gridview_6_pages/Utils/color.dart';
import 'package:gridview_6_pages/view/Home_Page/home_grid.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    _disableOnboarding(); // Call the async method at the top
  }

  // Async function to disable onboarding
  Future<void> _disableOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        "onboarding", false); // Set the onboarding status to false
  }

  final PageController _pageController = PageController();
  int _currentIndex = 0;
  void _onNavigationItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        titleTextStyle: const TextStyle(color: Colors.white),
        title: const Text(
          "6 Pages Grid",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        leading: const IconButton(
            onPressed: null,
            icon: Icon(
              Icons.menu_book,
            )),
        actions: const [IconButton(onPressed: null, icon: Icon(Icons.mode))],
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          grid(),
          const Center(
              child: Text('Favourite Page', style: TextStyle(fontSize: 24))),
          const Center(
              child: Text('Profile Page', style: TextStyle(fontSize: 24))),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: primaryColor,
        items: const <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.shopping_cart_rounded, size: 30),
          Icon(Icons.person, size: 30),
        ],
        index: _currentIndex,
        onTap: _onNavigationItemTapped,
      ),
    );
  }
}
