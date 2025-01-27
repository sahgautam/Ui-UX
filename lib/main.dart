import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:toursandtravel/screens/auth/login.dart';
import 'package:toursandtravel/screens/auth/register.dart';
import 'package:toursandtravel/screens/explore/explore.dart';
import 'package:toursandtravel/screens/home/home.dart';
import 'package:toursandtravel/screens/profile/account_settings/booking_history.dart';
import 'package:toursandtravel/screens/profile/account_settings/change_password.dart';
import 'package:toursandtravel/screens/profile/account_settings/edit_profile.dart';
import 'package:toursandtravel/screens/profile/account_settings/language_preferences.dart';
import 'package:toursandtravel/screens/profile/account_settings/notifications.dart';
import 'package:toursandtravel/screens/profile/account_settings/payment_method.dart';
import 'package:toursandtravel/screens/profile/profile.dart';
import 'package:toursandtravel/screens/profile/support/about_us.dart';
import 'package:toursandtravel/screens/profile/support/help_and_support.dart';
import 'package:toursandtravel/screens/profile/support/privacy_and_policy.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/explore': (context) => const ExplorePage(),
        '/profile': (context) => const ProfileScreen(),
        '/edit_profile': (context) => const EditProfilePage(),
        '/change_password': (context) => const ChangePasswordPage(),
        '/payment_methods': (context) => const PaymentMethodsPage(),
        '/booking_history': (context) => const BookingHistoryPage(),
        '/notifications': (context) => const NotificationsPage(),
        '/language_preferences': (context) => const LanguagePreferencesPage(),
        '/help_support': (context) => const HelpSupportPage(),
        '/privacy_policy': (context) => const PrivacyPolicyPage(),
        '/about_us': (context) => const AboutUsPage(),
      },
    );
  }
}
