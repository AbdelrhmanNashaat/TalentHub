import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hire_me/constant.dart';
import 'package:hire_me/features/home/presentation/views/widgets/home_view_body.dart';

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
        height: 55.0,
        items: <Widget>[
          Icon(FontAwesomeIcons.list, size: 22, color: _iconColor(0)),
          Icon(FontAwesomeIcons.hotel, size: 22, color: _iconColor(1)),
          Icon(FontAwesomeIcons.solidCompass, size: 28, color: _iconColor(2)),
          Icon(FontAwesomeIcons.bell, color: _iconColor(3)),
          Icon(FontAwesomeIcons.user, color: _iconColor(4)),
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
