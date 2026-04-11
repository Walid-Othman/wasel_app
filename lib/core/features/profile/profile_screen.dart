import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wasel_app/core/features/profile/component/balance.dart';
import 'package:wasel_app/core/features/profile/component/profile_info_component.dart';
import 'package:wasel_app/core/theme/light_colors/light_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
        ),
        title: Text(
          'My Profile',
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 17,
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: LightColors.orangeColor,
      ),
      body: Column(
        children: [Balance(), SizedBox(height: 20), ProfileInfoComponent()],
      ),
    );
  }
}
