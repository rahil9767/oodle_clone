import 'package:flutter/material.dart';
import 'package:oodle/pages/message_page.dart';
import 'package:oodle/pages/nearby_page.dart';
import 'package:oodle/pages/profile_page.dart';
import 'package:oodle/pages/search_page.dart';
import 'package:oodle/reusable_widgets/bottomNavigation_bar.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _list = [
    NearbyPage(),
    SearchPage(),
    MessagePage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _list[_selectedIndex], // Show the selected page
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
