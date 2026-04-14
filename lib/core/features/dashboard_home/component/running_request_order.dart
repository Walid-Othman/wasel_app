import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wasel_app/core/app_sizes/app_sizes.dart';
import 'package:wasel_app/core/features/dashboard_home/component/custom_order_card.dart';
import 'package:wasel_app/core/theme/light_colors/light_colors.dart';

class RunningRequestOrder extends StatelessWidget {
  const RunningRequestOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      showModalBottomSheet(
                        isScrollControlled: true,
                        
                        context: context, builder: (context){
                        
                            return CustomOrderCard();
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(AppSizes.r10),
                      width: AppSizes.w156,
                      
                      decoration: BoxDecoration(
                        color: LightColors.primaryColor,
                        borderRadius: BorderRadius.circular(AppSizes.r16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "20",
                            style: TextStyle(
                              color: LightColors.orangeColor,
                              fontSize: AppSizes.sp54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                       Text("Running Orders",style: TextStyle(fontSize: AppSizes.sp14,fontWeight: FontWeight.bold),) ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(AppSizes.r14),
                      width: AppSizes.w156,
                      
                      decoration: BoxDecoration(
                        color: LightColors.primaryColor,
                        borderRadius: BorderRadius.circular(AppSizes.r16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "05",
                            style: TextStyle(
                              color: LightColors.orangeColor,
                              fontSize: AppSizes.sp54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                       Text("Order Request",style: TextStyle(fontSize: AppSizes.sp14,fontWeight: FontWeight.bold),) ],
                      ),
                    ),
                  ),
                ],
              );
  }
}