// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_const_constructors
import 'package:crudsqf/pages/content/discount_page.dart';
import 'package:crudsqf/pages/content/home_page.dart';
import 'package:crudsqf/pages/content/notification_page.dart';
import 'package:crudsqf/pages/content/order_page.dart';
import 'package:crudsqf/pages/content/profile_page.dart';
import 'package:flutter/material.dart';

class navComponent extends StatefulWidget {
  const navComponent({super.key});

  @override
  State<navComponent> createState() => _MyAppState();
}

class _MyAppState extends State<navComponent> {
  int selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    HomeScreen(),
    DiscountScreen(),
    OrderScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _widgetOptions.elementAt(selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/home-Filled.png")),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/discount-Filled.png")),
              label: 'Promo',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/Order Completed.png")),
              label: 'Order',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/bell-Filled.png")),
              label: 'Notifikasi',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/user-Filled.png")),
              label: 'Profile',
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Color.fromARGB(255, 5, 43, 75),
          unselectedItemColor: Colors.grey,
          onTap: onItemTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: HomePage(),
    );
  }
}

class DiscountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: discountPage(),
    );
  }
}

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: orderPage(),
    );
  }
}

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: notificationPage(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: profilePage(),
    );
  }
}
