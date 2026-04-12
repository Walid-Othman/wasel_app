import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:wasel_app/core/theme/light_colors/light_colors.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: LightColors.primaryColor,
                      ),
                      child: SvgPicture.asset('assets/images/menu_two.svg'),
                    ),
                    SizedBox(width: 18),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LOCATION",
                          style: TextStyle(
                            color: LightColors.orangeColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Halal Lab office",
                              style: TextStyle(
                                color: Color(0xff676767),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                     ],
                    ),
                  Spacer(),
                  CircleAvatar(radius: 25,backgroundColor: LightColors.primaryColor,)],
                  
                ),
    );
  }
}