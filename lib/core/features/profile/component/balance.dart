import 'package:flutter/material.dart';
import 'package:wasel_app/core/theme/light_colors/light_colors.dart';

class Balance extends StatelessWidget {
  const Balance({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              color: LightColors.orangeColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Column(
              children: [
                Text(
                  'Available Balance',
                  style: TextStyle(
                    color: LightColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '\$500.00',
                  style: TextStyle(
                    color: LightColors.primaryColor,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 100,
                  height: 37,
                  decoration: BoxDecoration(
                    border: BoxBorder.all(color: LightColors.primaryColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Withdraw",
                      style: TextStyle(
                        color: LightColors.primaryColor,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}