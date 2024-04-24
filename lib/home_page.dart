import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oodle/pages/message_page.dart';
import 'package:oodle/pages/nearby_page.dart';
import 'package:oodle/pages/profile_page.dart';
import 'package:oodle/pages/search_page.dart';
import 'package:oodle/reusable_widgets/bottomNavigation_bar.dart';
import 'package:oodle/screens/signInScreen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return HomeContent();
          } else if (snapshot.hasError) {
            return Center(child: Text("Something Went Wrong!"));
          } else {
            return SignInScreen(); // Assuming you have a SignInPage widget
          }
        },
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
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
