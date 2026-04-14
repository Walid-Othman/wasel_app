import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel_app/core/app_sizes/app_sizes.dart';
import 'package:wasel_app/core/features/details/food_details_screen.dart';
import 'package:wasel_app/core/features/menu/component/custom_menu_with_shimer.dart';
import 'package:wasel_app/core/features/menu/cubit/menu_cubit.dart';
import 'package:wasel_app/core/shared/custome_cached_network_image.dart';
import 'package:wasel_app/core/theme/light_colors/light_colors.dart';
import 'package:wasel_app/core/config/request_status.dart';

class CustomMenu extends StatelessWidget {
  const CustomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuCubit, MenuState>(
      builder: (context, state) {
        switch (state.status) {
          case RequestStatus.loading:
            {
              return CustomMenuWithShimer();
            }
          case RequestStatus.error:
            {
              return Center(
                child: Text(state.errorMessage ?? "Faild to get data"),
              );
            }
          case RequestStatus.initial:
            {
              return const SizedBox.shrink();
            }
          case RequestStatus.loaded:
            {
              return Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverList.builder(
                      itemCount: state.menu.length,
                      itemBuilder: (context, index) {
                        final data = state.menu[index];
                        return Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: AppSizes.mw5,
                            vertical: AppSizes.mh15,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context,MaterialPageRoute(builder: (context)=>FoodDetailsScreen(data:data)));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF98A8B8),
                                    borderRadius: BorderRadius.circular(AppSizes.r16),
                                  ),
                                  child: CustomeCachedNetworkImage(
                                    urlImage: data.urlImage,
                                    width: AppSizes.w102,
                                    hight: AppSizes.w102,
                                  ),
                                ),
                              ),
                              SizedBox(width: AppSizes.w8),
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          data.title,
                                          style: TextStyle(
                                            color: LightColors.primaryBlack,
                                            fontSize: AppSizes.sp14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Spacer(),
                                        GestureDetector(
                                          child: Icon(Icons.more_horiz),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(AppSizes.r8),
                                          decoration: BoxDecoration(
                                            color: Color(0x10762233),
                                            borderRadius: BorderRadius.circular(
                                              50,
                                            ),
                                          ),
                                          child: Text(
                                            data.category,
                                            style: TextStyle(
                                              color: LightColors.orangeColor,
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          "\$${data.price}",
                                          style: TextStyle(
                                            color: LightColors.primaryBlack,
                                            fontSize: AppSizes.sp18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: AppSizes.h10),
                                    Row(
                                      children: [
                                        Icon(
                                          size: AppSizes.sp14,
                                          Icons.star,
                                          color: LightColors.orangeColor,
                                        ),
                                        Text(
                                          data.rating.toString(),
                                          style: TextStyle(
                                            color: LightColors.orangeColor,
                                            fontSize: AppSizes.sp14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: AppSizes.w4),
                                        Text(
                                          "(${data.reviewCount} Review)",
                                          style: TextStyle(
                                            color: Color(0xFFAFAFAF),
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          ' Pick UP',
                                          style: TextStyle(
                                            color: Color(0xFFAFAFAF),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            }
        }
      },
    );
  }
}
