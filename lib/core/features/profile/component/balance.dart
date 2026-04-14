import 'package:flutter/material.dart';
import 'package:wasel_app/core/app_sizes/app_sizes.dart';
import 'package:wasel_app/core/theme/light_colors/light_colors.dart';

class Balance extends StatelessWidget {
  const Balance({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
            width: double.infinity,
            height: AppSizes.h180,
            decoration: BoxDecoration(
              color: LightColors.orangeColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(AppSizes.r25),
                bottomRight: Radius.circular(AppSizes.r25),
              ),
            ),
            child: Column(
              children: [
                Text(
                  'Available Balance',
                  style: TextStyle(
                    color: LightColors.primaryColor,
                    fontSize: AppSizes.sp16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: AppSizes.h10),
                Text(
                  '\$500.00',
                  style: TextStyle(
                    color: LightColors.primaryColor,
                    fontSize: AppSizes.sp40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: AppSizes.h20),
                Container(
                  width: AppSizes.w100,
                  height: AppSizes.h37,
                  decoration: BoxDecoration(
                    border: BoxBorder.all(color: LightColors.primaryColor),
                    borderRadius: BorderRadius.circular(AppSizes.r5),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Withdraw",
                      style: TextStyle(
                        color: LightColors.primaryColor,
                        fontSize: AppSizes.sp10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}