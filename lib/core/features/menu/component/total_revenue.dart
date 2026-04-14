import 'package:flutter/material.dart';
import 'package:wasel_app/core/app_sizes/app_sizes.dart';
import 'package:wasel_app/core/theme/light_colors/light_colors.dart';
import 'package:wasel_app/core/features/dashboard_home/component/revenue_bar_chart.dart';

class TotalRevenue extends StatelessWidget {
  TotalRevenue({super.key});
  final List<String> days = ["Sat", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri"];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.r10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: LightColors.primaryColor,
        borderRadius: BorderRadius.circular(AppSizes.r16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Revenue",
                    style: TextStyle(
                      fontSize: AppSizes.sp14,
                      fontWeight: FontWeight.w400,
                      color: LightColors.primaryBlack,
                    ),
                  ),
                  SizedBox(height: AppSizes.h5),
                  Text(
                    "\$2,241",
                    style: TextStyle(
                      fontSize: AppSizes.sp22,
                      fontWeight: FontWeight.bold,
                      color: LightColors.orangeColor,
                    ),
                  ),
                ],
              ),
              SizedBox(width: AppSizes.w18),

              Container(
                padding: EdgeInsets.all(AppSizes.r10),
                decoration: BoxDecoration(
                  border: BoxBorder.all(color: Color(0xFFE8EAED)),
                  borderRadius: BorderRadius.circular(AppSizes.r16),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Daily",
                          style: TextStyle(
                            fontSize: AppSizes.sp12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF9C9BA6),
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                    Container(
                      height: 0,
                      // width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(AppSizes.r50),
                        boxShadow: [
                          BoxShadow(
                            color: LightColors.primaryBlack,
                            // blurRadius: 10,
                          ),
                        ],
                      ),
                      child: SizedBox(
                        height: 0,
                        width: AppSizes.w50,
                        child: ListWheelScrollView(
                          itemExtent: 50,
                          children: days
                              .map((e) => Center(child: Text(e)))
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Text(
                "See Details",
                style: TextStyle(
                  fontSize: AppSizes.sp14,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                  decorationThickness: 1.5,
                  color: LightColors.orangeColor,
                  decorationColor: LightColors.orangeColor,
                ),
              ),
            ],
          ),
          SizedBox(height: AppSizes.h20),
          SizedBox(
            width: double.infinity,
            height: AppSizes.h200,
            child: RevenueBarChart(),
          ),
        ],
      ),
    );
  }
}
