import 'package:flutter/material.dart';
import 'package:rootx_lasith/GPS/Google_Map.dart';
import 'package:rootx_lasith/screens/Payment_Option_Selection.dart';
import 'package:rootx_lasith/screens/Profile.dart';
import 'package:rootx_lasith/screens/busBooking1.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String username = "Asela"; // Placeholder for the username
  int _selectedIndex =
      0; // For tracking the selected bottom navigation bar item

  // List of screens to navigate to
  final List<Widget> _screens = [
    const PaymentHomeScreen(), // Home screen
    const BusSelectionScreen(),
    const MapScreen(), // Location screen
    const ProfilePage(), // Profile screen
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index to switch screens
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light background
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back action
            Navigator.pushNamed(context, '/');
          },
        ),
        elevation: 0,
        backgroundColor: const Color.fromRGBO(255, 169, 89, 1), // Orange color
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage:
                  AssetImage('assets/images/passenger.png'), // User image
              radius: 20, // Slightly larger radius for better visibility
            ),
            const SizedBox(width: 10),
            Text(
              username,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Navigator.pushNamed(context, '/payment_option_selection');
            },
          ),
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Menu action
            },
          ),
        ],
      ),
      // Use AnimatedSwitcher to animate the screen transitions
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _screens[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor:
            const Color.fromRGBO(255, 169, 89, 1), // Orange background
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: _selectedIndex, // Show the current index
        onTap: _onItemTapped, // Handle tap
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 28), // Increased icon size
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus, size: 28), // Increased icon size
            label: 'Bus',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on, size: 28), // Increased icon size
            label: 'Location',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 28), // Increased icon size
            label: 'Profile',
          ),
        ],
        showSelectedLabels: true, // Show labels for selected items
        showUnselectedLabels: true, // Show labels for unselected items
      ),
    );
  }
}
