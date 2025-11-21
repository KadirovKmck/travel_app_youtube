import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:scaffold_plus/scaffold_plus.dart';

import 'package:travel_app_youtube/features/calendar/calendar_view.dart';
import 'package:travel_app_youtube/features/home/home.dart';
import 'package:travel_app_youtube/features/messages/messages_view.dart';
import 'package:travel_app_youtube/features/profile/profile_view.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({super.key});

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  int _index = 0;

  static const Color _bg = Color(0xFF0E1B2B);

  static const Color _barColor = Color.fromARGB(93, 255, 255, 255);
  static const Color _inactiveColor = Color(0xFF8C8F99);
  static const Color _activeColor = Color(0xFF45B5FF);

  late final List<Widget> _pages = <Widget>[
    const HomeMain(),
    const CalendarView(),
    const MessagesPage(),
    const ProfileView(),
  ];

  void _onItemTap(int i) {
    HapticFeedback.lightImpact();
    if (i < 0 || i >= _pages.length) return;
    setState(() => _index = i);
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = Device.screenType == ScreenType.tablet;

    final sideInset = isTablet ? 4.w : 5.w;
    final barHeight = isTablet ? 8.5.h : 8.0.h;
    const blur = 18.0;

    return ScaffoldPlus(
      top: false,
      backgroundColor: _bg,
      body: Stack(
        children: [
          IndexedStack(index: _index, children: _pages),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                left: sideInset,
                right: sideInset,
                bottom: 2.2.h,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(26),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
                  child: Container(
                    height: barHeight,
                    decoration: BoxDecoration(
                      color: _barColor,
                      borderRadius: BorderRadius.circular(26),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.07),
                          blurRadius: 16,
                          offset: const Offset(0, -2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _BottomItem(
                          index: 0,
                          currentIndex: _index,
                          icon: CupertinoIcons.home,
                          label: 'Home',
                          activeColor: _activeColor,
                          inactiveColor: _inactiveColor,
                          onTap: _onItemTap,
                        ),
                        _BottomItem(
                          index: 1,
                          currentIndex: _index,
                          icon: CupertinoIcons.calendar,
                          label: 'calendar',
                          activeColor: _activeColor,
                          inactiveColor: _inactiveColor,
                          onTap: _onItemTap,
                        ),
                        _BottomItem(
                          index: 2,
                          currentIndex: _index,
                          icon: CupertinoIcons.chat_bubble_2,
                          label: 'Messages',
                          activeColor: _activeColor,
                          inactiveColor: _inactiveColor,
                          onTap: _onItemTap,
                        ),
                        _BottomItem(
                          index: 3,
                          currentIndex: _index,
                          icon: CupertinoIcons.person,
                          label: 'Profile',
                          activeColor: _activeColor,
                          inactiveColor: _inactiveColor,
                          onTap: _onItemTap,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomItem extends StatelessWidget {
  final int index;
  final int currentIndex;
  final IconData icon;
  final String label;
  final Color activeColor;
  final Color inactiveColor;
  final ValueChanged<int> onTap;

  const _BottomItem({
    required this.index,
    required this.currentIndex,
    required this.icon,
    required this.label,
    required this.activeColor,
    required this.inactiveColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = index == currentIndex;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onTap(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 24, color: isActive ? activeColor : inactiveColor),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                color: isActive ? activeColor : inactiveColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
