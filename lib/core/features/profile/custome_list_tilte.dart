import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasel_app/core/theme/light_colors/light_colors.dart';

class CustomeListTilte extends StatelessWidget {
  const CustomeListTilte({
    super.key,
    this.title,
    this.image,
    this.icone,
    required this.onTap,
  });
  final String? title;
  final String? image;
  final String? icone;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(title ?? "Personal Info"),
      leading: Container(
        decoration: BoxDecoration(
          color: LightColors.primaryColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(image ?? "assets/images/user.svg"),
        ),
      ),
      trailing: icone == null ? Icon(Icons.arrow_forward) : Text(icone!),
    );
  }
}
