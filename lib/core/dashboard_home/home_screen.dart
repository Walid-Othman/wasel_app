import 'package:flutter/material.dart';

import 'package:wasel_app/core/dashboard_home/component/header.dart';
import 'package:wasel_app/core/dashboard_home/component/populer_items.dart';
import 'package:wasel_app/core/dashboard_home/component/reviews_componnet.dart';

import 'package:wasel_app/core/dashboard_home/component/running_request_order.dart';

import 'package:wasel_app/core/menu/component/total_revenue.dart';
import 'package:wasel_app/core/menu/menu_screen.dart';
import 'package:wasel_app/core/shared/custome_cached_network_image.dart';
import 'package:wasel_app/core/theme/light_colors/light_colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Header(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 24),
                      RunningRequestOrder(),
                      SizedBox(height: 24),
                      TotalRevenue(),
                      SizedBox(height: 24),
                      ReviewsComponnet(),
                      SizedBox(height: 24),
                      PopulerItems(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
