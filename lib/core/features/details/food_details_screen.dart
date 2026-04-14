import 'package:flutter/material.dart';
import 'package:wasel_app/core/app_sizes/app_sizes.dart';
import 'package:wasel_app/core/features/details/component/Custome_ingridents.dart';
import 'package:wasel_app/core/features/details/component/food_card.dart';
import 'package:wasel_app/core/features/menu/model/menu_model.dart';
import 'package:wasel_app/core/shared/custome_cached_network_image.dart';
import 'package:wasel_app/core/theme/light_colors/light_colors.dart';

class FoodDetailsScreen extends StatelessWidget {
  const FoodDetailsScreen({super.key, required this.data});
  final MenuModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Details', style: TextStyle(fontSize: AppSizes.sp18)),
        actions: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: AppSizes.w10),
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Edit",
                style: TextStyle(color: LightColors.orangeColor, fontSize: AppSizes.sp14),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(AppSizes.r16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FoodCard(data: data),
              SizedBox(height: AppSizes.h15),
              Divider(color: Color(0xFFF0F4F9),),
              SizedBox(height: AppSizes.h15),
              CustomeIngridents(data: data),
          Text("Description",style: TextStyle(fontWeight: FontWeight.w500),) ,
          SizedBox(height: AppSizes.h8,),
          Text(data.descraption,style: TextStyle(color: Color(0xFF747783)),) ],
          ),
        ),
      ),
    );
  }
}
