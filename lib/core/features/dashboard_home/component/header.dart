import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:wasel_app/core/app_sizes/app_sizes.dart';
import 'package:wasel_app/core/theme/light_colors/light_colors.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.all(AppSizes.r8),
      child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(AppSizes.r10),
                      width: AppSizes.w45,
                      height: AppSizes.w45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSizes.r50),
                        color: LightColors.primaryColor,
                      ),
                      child: SvgPicture.asset('assets/images/menu_two.svg'),
                    ),
                    SizedBox(width: AppSizes.w18),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LOCATION",
                          style: TextStyle(
                            color: LightColors.orangeColor,
                            fontSize: AppSizes.sp12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Halal Lab office",
                              style: TextStyle(
                                color: Color(0xff676767),
                                fontSize: AppSizes.sp14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                     ],
                    ),
                  Spacer(),
                  CircleAvatar(radius: AppSizes.r25,backgroundColor: LightColors.primaryColor,)],
                  
                ),
    );
  }
}