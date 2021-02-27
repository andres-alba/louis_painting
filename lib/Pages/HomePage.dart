import 'package:flutter/material.dart';
import 'package:louis_painting/Pages/firstPage.dart';
import 'package:louis_painting/Pages/favoritePage.dart';
import 'package:firebase_auth/firebase_auth.dart';

int index = 0;

class HomePage extends StatefulWidget {
  const HomePage({Key key, @required this.user}) : super(key: key);
  final User user;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  List<Widget> _screens = [
    FirstPage(),
    FavoritePage(),
  ];

  int _selectedIndex = 0;
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.picture_as_pdf,
              color: _selectedIndex == 1 ? Colors.blue : Colors.grey,
            ),
            title: Text(
              'Favorites',
              style: TextStyle(
                color: _selectedIndex == 1 ? Colors.blue : Colors.grey,
              ),
            ),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
