import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:pas1_mobile_11pplg1_04/screens/Favorite/favorite_view.dart';
import 'package:pas1_mobile_11pplg1_04/screens/liga%20Inggris/bola_view.dart';

import '../Profile/profile_screen.dart';


class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  final List<Widget> _screens = [

    BolaView(),
    FavoriteView(),
    ProfileScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      // Menampilkan halaman sesuai index saat ini
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: MotionTabBar(
          initialSelectedTab: "Liga",
          useSafeArea: true,
          labels: const ["Liga", "Favorite", "Profile"],
          icons: const [Icons.sports_baseball_outlined, Icons.favorite_border, Icons.person_outline],
          tabSize: 50,
          tabBarHeight: 55,
          textStyle: const TextStyle(
            fontSize: 12,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
          tabIconColor: Colors.grey[600],
          tabIconSize: 28.0,
          tabIconSelectedSize: 26.0,
          tabSelectedColor: Colors.blue[800],
          tabIconSelectedColor: Colors.white,
          onTabItemSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
