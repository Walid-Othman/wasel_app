import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wasel_app/core/theme/light_colors/light_colors.dart';
import 'package:wasel_app/core/app_sizes/app_sizes.dart';
import 'package:wasel_app/core/shared/custome_shimmer_widget.dart';
import 'package:wasel_app/core/shared/widgets/cart_contanir.dart';

class CustomeProfileInfoShimmer extends StatelessWidget {
  const CustomeProfileInfoShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(AppSizes.r12),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              CartContanir(
                child: Padding(
                  padding: EdgeInsets.all(AppSizes.r20),
                  child: Column(
                    children: [
                      CustomeShimmerWidget(
                        width: AppSizes.h80,
                        hight: AppSizes.h80,
                        redus: AppSizes.r50,
                      ),
                      SizedBox(height: AppSizes.h16),
                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        padding: EdgeInsets.all(AppSizes.r12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomeShimmerWidget(
                              width: 120,
                              hight: 18,
                              redus: 4,
                            ),
                            SizedBox(height: AppSizes.h12),
                            const CustomeShimmerWidget(
                              width: 200,
                              hight: 22,
                              redus: 4,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: AppSizes.h20),

              CartContanir(
                child: Padding(
                  padding: EdgeInsets.all(AppSizes.r20),
                  child: Column(
                    children: [
                      _buildShimmerItemRow(),
                      SizedBox(height: AppSizes.h24),
                      _buildShimmerItemRow(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: AppSizes.h20),

              CartContanir(
                child: Padding(
                  padding: EdgeInsets.all(AppSizes.r20),
                  child: Column(
                    children: [
                      _buildShimmerItemRow(),
                      SizedBox(height: AppSizes.h24),
                      _buildShimmerItemRow(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: AppSizes.h24),

              CustomeShimmerWidget(
                width: MediaQuery.sizeOf(context).width,
                hight: 56,
                redus: AppSizes.r12,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShimmerItemRow() {
    return Row(
      children: [
        const CustomeShimmerWidget(width: 36, hight: 36, redus: 8),
        SizedBox(width: AppSizes.h16),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomeShimmerWidget(width: 140, hight: 16, redus: 4),
              SizedBox(height: 8),
              CustomeShimmerWidget(width: 180, hight: 16, redus: 4),
            ],
          ),
        ),
        const CustomeShimmerWidget(width: 24, hight: 24, redus: 6),
      ],
    );
  }
}
