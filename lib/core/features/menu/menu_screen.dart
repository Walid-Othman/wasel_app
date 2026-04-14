import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel_app/core/config/request_status.dart';
import 'package:wasel_app/core/features/details/food_details_screen.dart';
import 'package:wasel_app/core/features/menu/category_model.dart';
import 'package:wasel_app/core/features/menu/component/Custom_menu.dart';
import 'package:wasel_app/core/features/menu/cubit/menu_cubit.dart';
import 'package:wasel_app/core/shared/custome_cached_network_image.dart';
import 'package:wasel_app/core/theme/light_colors/light_colors.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuCubit()..fetchMenu(),
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          title: Text('My Food List'),
          backgroundColor: LightColors.primaryColor,
        ),
        body: BlocBuilder<MenuCubit, MenuState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: CategoryModel.categories.length,
                      itemBuilder: (context, index) {
                        
                        return GestureDetector(
                          onTap: () {
                            
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              CategoryModel.categories[index].title.toString(),
                              style: TextStyle(color: LightColors.orangeColor,fontSize: 14,fontWeight: FontWeight.w600),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Text(
                    'Total 03 items',
                    style: TextStyle(color: Color(0XFF9C9BA6)),
                  ),
                  SizedBox(height: 10),
                  CustomMenu(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
