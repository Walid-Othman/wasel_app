import 'package:flutter/material.dart';
import 'package:wasel_app/core/app_sizes/app_sizes.dart';
import 'package:wasel_app/core/features/menu/menu_screen.dart';
import 'package:wasel_app/core/shared/custome_cached_network_image.dart';
import 'package:wasel_app/core/theme/light_colors/light_colors.dart';

class PopulerItems extends StatelessWidget {
  const PopulerItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.r10),
      // height: 20,
      decoration: BoxDecoration(
        color: LightColors.primaryColor,
        borderRadius: BorderRadius.circular(AppSizes.r16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Populer Items This Weeks',
                style: TextStyle(
                  fontSize: AppSizes.sp14,
                  fontWeight: FontWeight.w400,
                  color: LightColors.primaryBlack,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MenuScreen()),
                  );
                },
                child: Text(
                  'See All',
                  style: TextStyle(
                    fontSize: AppSizes.sp14,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    decorationColor: LightColors.orangeColor,
                    color: LightColors.orangeColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: AppSizes.h24),
          SizedBox(
            height: AppSizes.h120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, idex) {
                return Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(AppSizes.r5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSizes.r16),
                          color: Colors.grey[300],
                        ),
                        child: CustomeCachedNetworkImage(urlImage: ""),
                      ),
                      Text(
                        "pizza",
                        style: TextStyle(
                          fontSize: AppSizes.sp16,
                          fontWeight: FontWeight.bold,
                          color: LightColors.orangeColor,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
