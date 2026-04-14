import 'package:flutter/material.dart';
import 'package:wasel_app/core/app_sizes/app_sizes.dart';
import 'package:wasel_app/core/features/menu/cubit/menu_cubit.dart';
import 'package:wasel_app/core/features/menu/model/menu_model.dart';
import 'package:wasel_app/core/shared/custome_cached_network_image.dart';

class CustomeIngridents extends StatelessWidget {
  final MenuModel data;
  const CustomeIngridents({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("ingridents", style: TextStyle(fontWeight: FontWeight.w500)),
        SizedBox(height: AppSizes.h15),
        data.ingredients.isEmpty
            ? Center(child: Text("No Ingridents Add If You Want",style: TextStyle(color:Color(0xFF6B6E82) ),))
            : GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: data.ingredients.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisExtent: 100,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        padding:  EdgeInsets.all(AppSizes.r8),
                        decoration: BoxDecoration(
                          color: const Color(0xFF98A8B8),
                          borderRadius: BorderRadius.circular(AppSizes.r50),
                        ),
                        child: CustomeCachedNetworkImage(
                          urlImage: data.ingredients[index].itemImage,
                          width: AppSizes.w50,
                          hight: AppSizes.w50,
                        ),
                      ),
                       SizedBox(height: AppSizes.h5),
                      Text(
                        data.ingredients[index].name,
                        style:  TextStyle(fontSize: AppSizes.sp12),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  );
                },
              ),
        SizedBox(height: AppSizes.h10),
        Divider(color: Color(0xFFF0F4F9)),
      ],
    );
  }
}
