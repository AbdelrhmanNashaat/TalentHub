import 'package:flutter/material.dart';
import 'package:hire_me/constant.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      decoration: const NavBarDecoration(
        colorBehindNavBar: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      navBarHeight: 55,
      navBarStyle: NavBarStyle.style9,
      context,
      screens: const [
        Scaffold(),
        Scaffold(),
        Scaffold(),
        Scaffold(),
      ],
      items: [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          title: 'Home',
          activeColorPrimary: Colors.black,
          inactiveColorPrimary: Colors.grey,
          contentPadding: 6,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.search),
          title: 'Search',
          activeColorPrimary: Colors.black,
          inactiveColorPrimary: Colors.grey,
          contentPadding: 6,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.add),
          title: 'Add',
          activeColorPrimary: Colors.black,
          inactiveColorPrimary: Colors.grey,
          contentPadding: 6,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
          title: 'Profile',
          activeColorPrimary: Colors.black,
          inactiveColorPrimary: Colors.grey,
          contentPadding: 6,
        ),
      ],
      handleAndroidBackButtonPress: true,
      hideNavigationBarWhenKeyboardAppears: true,
      padding: const EdgeInsets.all(6),
      backgroundColor: Constant.navBarColor,
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 400),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
    );
  }
}
