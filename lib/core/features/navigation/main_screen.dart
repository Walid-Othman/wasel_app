import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wasel_app/core/features/dashboard_home/home_screen.dart';

import 'package:wasel_app/core/features/items/add_item_screen.dart';
import 'package:wasel_app/core/features/notifications_messages/navigation/navigation_screen.dart';

import 'package:wasel_app/core/features/profile/profile_screen.dart';

import 'package:wasel_app/core/features/menu/menu_screen.dart';
import 'package:wasel_app/core/theme/light_colors/light_colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    MenuScreen(),
    AddItemScreen(),
    NavigationScreen(),
    ProfileScreen(),
  ];

  SvgPicture _buildSvgPicture(String imgUrl, int index) {
    return SvgPicture.asset(
      imgUrl,
      colorFilter: ColorFilter.mode(
        _currentIndex == index ? LightColors.orangeColor : Color(0xFFC6C6C6),
        BlendMode.srcIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int? index) async {
          setState(() {
            _currentIndex = index ?? 0;
          });
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: _buildSvgPicture('assets/images/shap.svg', 0),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: _buildSvgPicture('assets/images/menu.svg', 1),

            label: "",
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: BoxBorder.all(color: LightColors.orangeColor),
                borderRadius: BorderRadius.circular(50),
              ),

              child: Icon(Icons.add, color: LightColors.orangeColor),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: _buildSvgPicture('assets/images/bell.svg', 3),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: _buildSvgPicture('assets/images/person.svg', 4),

            label: '',
          ),
        ],
      ),
      body: screens[_currentIndex],
    );
  }
}
