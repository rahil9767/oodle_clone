import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigationBarWidget({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      showUnselectedLabels: true,
      selectedItemColor: Colors.deepPurple,
      unselectedItemColor: Colors.grey,
      iconSize: 20,
      backgroundColor: Colors.transparent,
      items: [
        BottomNavigationBarItem(
          icon: GestureDetector(

            onTap: () {
              onTap(0);
            },
            child: Icon(Icons.near_me, color: Colors.black87),
          ),
          label: 'Nearby',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              onTap(1);
            },
            child: Icon(Icons.search, color: Colors.black87),
          ),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              onTap(2);
            },
            child: Icon(Icons.message, color: Colors.black87),
          ),
          label: 'Message',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              onTap(3);
            },
            child: Icon(Icons.person, color: Colors.black87),
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
