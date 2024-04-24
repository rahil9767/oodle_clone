import 'package:flutter/material.dart';
import 'package:oodle/home_page.dart';
import '../screens/editProfileScreen.dart';
import '../screens/signInScreen.dart';

class AppRoutes {
  static const String signIn = '/signup';
  static const String editProfile = '/edit_profile'; // Corrected route name
  static const String closeFriends = '/close_friends'; // Corrected route name
  static const String blockedAccount = '/blocked_account'; // Corrected route name
  static const String settings = '/settings'; // Corrected route name
  static const String inviteFriends = '/invite_friends'; // Corrected route name
  static const String supportFeedback = '/support_feedback'; // Corrected route name
  static const String logout = '/logout';
  static const String homepage = '/homepage';

  static Map<String, WidgetBuilder> get routes => {
    editProfile: (_) => const EditProfile(), // Corrected route name and screen widget
    // closeFriends: (_) => CloseFriendsScreen(), // Corrected route name and screen widget
    // blockedAccount: (_) => BlockedAccountScreen(), // Corrected route name and screen widget
    // settings: (_) => SettingsScreen(), // Corrected route name and screen widget
    // inviteFriends: (_) => InviteFriendsScreen(), // Corrected route name and screen widget
    // supportFeedback: (_) => SupportFeedbackScreen(), // Corrected route name and screen widget
    signIn: (_) => const SignInScreen(),
    logout: (_) => const SignInScreen(),
    homepage: (_) => const HomePage(),//
  };
}
