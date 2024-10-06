import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hire_me/constant.dart';
import 'package:hire_me/features/home/presentation/views/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 2;

  final List<Widget> _screens = [
    const Icon(Icons.edit, size: 30),
    const Icon(Icons.edit, size: 30),
    const HomeViewBody(),
    const Icon(Icons.notifications, size: 30),
    const Icon(Icons.person, size: 30),
  ];
  Color _iconColor(int index) {
    return _selectedIndex == index ? Constant.iconColor : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _screens[_selectedIndex],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: _iconColor(0)),
          Icon(Icons.edit, size: 30, color: _iconColor(1)),
          Icon(Icons.explore, size: 30, color: _iconColor(2)),
          Icon(Icons.notifications, size: 30, color: _iconColor(3)),
          Icon(Icons.person, size: 30, color: _iconColor(4)),
        ],
        color: Constant.navBarColor,
        buttonBackgroundColor: Constant.navBarColor,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
