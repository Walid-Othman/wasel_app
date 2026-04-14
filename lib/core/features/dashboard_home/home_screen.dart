import 'package:flutter/material.dart';
import 'package:wasel_app/core/app_sizes/app_sizes.dart';

import 'package:wasel_app/core/features/dashboard_home/component/header.dart';
import 'package:wasel_app/core/features/dashboard_home/component/populer_items.dart';
import 'package:wasel_app/core/features/dashboard_home/component/reviews_componnet.dart';

import 'package:wasel_app/core/features/dashboard_home/component/running_request_order.dart';

import 'package:wasel_app/core/features/menu/component/total_revenue.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: EdgeInsets.all(AppSizes.r16),
        child: Column(
          children: [
            SizedBox(height: AppSizes.h25,),
            Header(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: AppSizes.h24),
                    RunningRequestOrder(),
                    SizedBox(height: AppSizes.h24),
                    TotalRevenue(),
                    SizedBox(height: AppSizes.h24),
                    ReviewsComponnet(),
                    SizedBox(height: AppSizes.h24),
                    PopulerItems(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
