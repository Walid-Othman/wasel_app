import 'package:flutter/widgets.dart';
import 'package:wasel_app/core/theme/light_colors/light_colors.dart';

class RunningRequestOrder extends StatelessWidget {
  const RunningRequestOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 156,
                      
                      decoration: BoxDecoration(
                        color: LightColors.primaryColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "20",
                            style: TextStyle(
                              color: LightColors.orangeColor,
                              fontSize: 54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                       Text("Running Orders",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),) ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 156,
                      
                      decoration: BoxDecoration(
                        color: LightColors.primaryColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "05",
                            style: TextStyle(
                              color: LightColors.orangeColor,
                              fontSize: 54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                       Text("Order Request",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),) ],
                      ),
                    ),
                  ),
                ],
              );
  }
}