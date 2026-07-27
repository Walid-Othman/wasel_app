import 'package:flutter/material.dart';
import 'package:wasel_app/core/app_sizes/app_sizes.dart';

class CustomeItemIcon extends StatelessWidget {
  const CustomeItemIcon({
    super.key,
    this.icon,
    this.trailing,
    this.title,
    this.subtitle,
  });
  final Widget? icon;
  final Widget? trailing;
  final String? title;
  final String? subtitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: AppSizes.w50,
        height: AppSizes.w50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSizes.r100),
        ),
        child: icon ?? Icon(Icons.phone),
      ),
      title: Text(title ?? 'Phone Number'),
      subtitle: Text(subtitle ?? '01037787649'),
      trailing: trailing,
    );
  }
}
