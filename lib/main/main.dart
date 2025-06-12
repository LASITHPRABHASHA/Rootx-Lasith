// Importing Flutter material package for UI components
import 'package:flutter/material.dart';

// Importing pages for the application
import 'package:rootx_lasith/profile/edit_profile_page.dart';
import 'package:rootx_lasith/profile/notifications_page.dart';
import 'package:rootx_lasith/profile/payments_page.dart';
import 'package:rootx_lasith/profile/privacy_page.dart';
import 'package:rootx_lasith/screens/home.dart';
import 'package:rootx_lasith/screens/homeScreen1.dart';
import 'package:rootx_lasith/screens/homeScreen2.dart';
import 'package:rootx_lasith/screens/login.dart';
import 'package:rootx_lasith/screens/passwordReset.dart';
import 'package:rootx_lasith/screens/signUp.dart';

// Entry point of the application
void main() => runApp(const MyApp());

// Main application widget
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor for the MyApp class

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Disable debug banner
      debugShowCheckedModeBanner: false,

      // Application title
      title: 'Booking App',

      // Define the application theme
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // Set the initial screen (route)
      initialRoute: '/',

      // Define named routes for navigation
      routes: {
        '/': (context) => const WelcomeScreen1(), // Initial screen
        '/welcome': (context) =>
            const WelcomeScreen2(), // Secondary welcome screen
        '/login': (context) => const LoginPage1(), // Login page
        '/password reset': (context) =>
            const PasswordResetScreen(), // Password reset screen
        '/sign up': (context) => const SignUp(), // Sign-up page
        '/Login_Home_Screen': (context) =>
            const PaymentScreen(), // Post-login home screen
        '/editProfile': (context) =>
            const EditProfilePage(), // Edit profile page
        '/notifications': (context) =>
            const NotificationsPage(), // Notifications page
        '/privacy': (context) => const PrivacyPage(), // Privacy policy page
        '/payments': (context) => const PaymentsPage(), // Payments page
      },
    );
  }
}

// Function to handle driver selection
void handleDriverSelection(BuildContext context) {
  // Perform any logic related to driver selection

  // Navigate to the booking page (route '/booking') when driver is selected
  Navigator.pushNamed(context, '/booking');
}

// Function to handle passenger selection
void handlePassengerSelection(BuildContext context) {
  // Perform any logic related to passenger selection

  // Navigate to the profile page (route '/profile') when passenger is selected
  Navigator.pushNamed(context, '/profile');
}
