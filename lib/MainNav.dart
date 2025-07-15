import 'package:first_flutter/HomePage/HomePage.dart';
import 'package:first_flutter/LaporanSection/LaporanPage.dart';
import 'package:first_flutter/NotificationSection/NotificationPage.dart';
import 'package:first_flutter/ProfileSection/ProfilePage.dart';
import 'package:flutter/material.dart';

class MainNav extends StatefulWidget {
  const MainNav({super.key});

  @override
  State<MainNav> createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  int _selectedIndex = 1;

  final List<Widget> _pages = [
    HomePage(),
    LaporanPage(),
    NotificationPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isPotrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    
    final iconSize = isPotrait ? screenWidth * 0.07 : screenWidth * 0.038;
    final fontSize = isPotrait ? screenWidth * 0.035 : screenWidth * 0.015;
    final navBarHeight = isPotrait ? screenWidth * 0.18 : screenWidth * 0.08;

    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: SizedBox(
        height: navBarHeight,
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Color(0xFF5F5F54),
          unselectedItemColor: Color(0xFF929292),
          selectedFontSize: fontSize,
          unselectedFontSize: fontSize,
          iconSize: iconSize,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment_outlined),
              activeIcon: Icon(Icons.assignment),
              label: 'Laporan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none),
              activeIcon: Icon(Icons.notifications),
              label: 'Notifikasi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}
