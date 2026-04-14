import 'package:flutter/material.dart';
import 'package:wasel_app/core/theme/light_colors/light_colors.dart';
import 'package:wasel_app/core/features/dashboard_home/component/revenue_bar_chart.dart';

class TotalRevenue extends StatelessWidget {
  TotalRevenue({super.key});
  final List<String> days = ["Sat", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri"];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: LightColors.primaryColor,
        borderRadius: BorderRadius.circular(16),
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
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: LightColors.primaryBlack,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "\$2,241",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: LightColors.orangeColor,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 18),

              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: BoxBorder.all(color: Color(0xFFE8EAED)),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Daily",
                          style: TextStyle(
                            fontSize: 12,
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
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: LightColors.primaryBlack,
                            // blurRadius: 10,
                          ),
                        ],
                      ),
                      child: SizedBox(
                        height: 0,
                        width: 50,
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
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                  decorationThickness: 1.5,
                  color: LightColors.orangeColor,
                  decorationColor: LightColors.orangeColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 200,
            child: RevenueBarChart(),
          ),
        ],
      ),
    );
  }
}
