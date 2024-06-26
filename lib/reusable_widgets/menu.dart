import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../utils/colour.dart';
import '../routes/app_routes.dart'; // Import the AppRoutes class

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  late AnimationController _staggeredController;

  @override
  void initState() {
    super.initState();
    _staggeredController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..forward();
    _createAnimationIntervals();
  }

  @override
  void dispose() {
    _staggeredController.dispose();
    super.dispose();
  }

  static const _menuTitles = [
    'Edit profile',
    'Close Friends',
    'Blocked Account',
    'Setting',
    'Invite Your friends to Oodle',
    'Support & Feedback',
    'Logout',
  ];

  static const _initialDelayTime = Duration(milliseconds: 50);
  static const _itemSlideTime = Duration(milliseconds: 250);
  static const _staggerTime = Duration(milliseconds: 50);
  static const _buttonDelayTime = Duration(milliseconds: 150);
  static const _buttonTime = Duration(milliseconds: 500);
  final _animationDuration = _initialDelayTime +
      (_staggerTime * _menuTitles.length) +
      _buttonDelayTime +
      _buttonTime;

  final List<Interval> _itemSlideIntervals = [];

  void _createAnimationIntervals() {
    for (var i = 0; i < _menuTitles.length; ++i) {
      final startTime = _initialDelayTime + (_staggerTime * i);
      final endTime = startTime + _itemSlideTime;
      _itemSlideIntervals.add(
        Interval(
          startTime.inMilliseconds / _animationDuration.inMilliseconds,
          endTime.inMilliseconds / _animationDuration.inMilliseconds,
        ),
      );
    }
  }

  Widget _buildMenuItem(int index) {
    List<IconData> leadingIcons = [
      CupertinoIcons.person,
      CupertinoIcons.person_2,
      CupertinoIcons.nosign,
      CupertinoIcons.settings,
      CupertinoIcons.arrow_turn_up_left,
      CupertinoIcons.headphones,
      CupertinoIcons.arrow_right,
    ];

    final Animation<double> animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _staggeredController,
        curve: Interval(
          _itemSlideIntervals[index].begin,
          _itemSlideIntervals[index].end,
          curve: Curves.easeInOut,
        ),
      ),
    );

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return FadeTransition(
          opacity: animation,
          child: ListTile(
            leading: Icon(
              leadingIcons[index],
              color: Colors.white,
            ),
            trailing: const Icon(
              CupertinoIcons.forward,
              color: Colors.white,
            ),
            title: Text(
              _menuTitles[index],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              // Handle menu item tap
              _handleMenuItemTap(index,context);
            },
          ),
        );
      },
    );
  }



  void _handleMenuItemTap(int index, BuildContext context) async {
    switch (index) {
      case 0: // Edit profile
        Navigator.pushNamed(context, AppRoutes.editProfile);
        break;
      case 1: // Close Friends
        Navigator.pushNamed(context, AppRoutes.closeFriends);
        break;
      case 2: // Blocked Account
        Navigator.pushNamed(context, AppRoutes.blockedAccount);
        break;
      case 3: // Setting
        Navigator.pushNamed(context, AppRoutes.settings);
        break;
      case 4: // Invite Your friends to Oodle
        Navigator.pushNamed(context, AppRoutes.inviteFriends);
        break;
      case 5: // Support & Feedback
        Navigator.pushNamed(context, AppRoutes.supportFeedback);
        break;
      case 6: // Logout
        await _handleLogout(context);
        break;
      default:
      // Handle default case
        break;
    }
  }

  Future<void> _handleLogout(BuildContext context) async {
    final googleSignIn = GoogleSignIn();
    final firebaseAuth = FirebaseAuth.instance;

    try {
      await googleSignIn.signOut(); // Sign out from Google
      await firebaseAuth.signOut(); // Sign out from Firebase Auth
      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.signIn, (route) => false);
    } catch (error) {
      print('Logout error: $error');
      // Handle logout error, show a snackbar or alert dialog to notify the user
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Account',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: MyColors.gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: MyColors.gradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: _buildMenuList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuList() {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              for (int index = 0; index < 4; index++) _buildMenuItem(index),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3), // Outline
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              for (int index = 4; index < 6; index++) _buildMenuItem(index),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.white,
              width: 2,
              style: BorderStyle.solid,
            ), // Border
          ),
          child: Column(
            children: [
              for (int index = 6; index < _menuTitles.length; index++)
                _buildMenuItem(index),
            ],
          ),
        )
      ],
    );
  }
}
