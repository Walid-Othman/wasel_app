import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel_app/core/app_sizes/app_sizes.dart';
import 'package:wasel_app/core/config/request_status.dart';
import 'package:wasel_app/core/features/dashboard_home/component/custom_order_card_with_shimmer.dart';
import 'package:wasel_app/core/features/dashboard_home/orders/cubit/orders_cubit.dart';
import 'package:wasel_app/core/di/injection_container.dart';
import 'package:wasel_app/core/shared/custome_cached_network_image.dart';
import 'package:wasel_app/core/theme/light_colors/light_colors.dart';

class CustomOrderCard extends StatelessWidget {
  CustomOrderCard({super.key});
  final orderCubit = sl<OrdersCubit>()..fetchOrders();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      bloc: orderCubit,
      builder: (context, state) {
        switch (state.status) {
          case RequestStatus.loading:
            {
              return CustomOrderCardWithShimmer();
            }
          case RequestStatus.error:
            {
              return Center(
                child: Text(state.errorMessage ?? "Faild to get data"),
              );
            }
          case RequestStatus.initial:
            {
              return SizedBox.shrink();
            }
          case RequestStatus.loaded:
            {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppSizes.h20),
                    Padding(
                      padding: EdgeInsets.only(left: AppSizes.w20, bottom: 4),
                      child: Text(
                        "${state.orders.length} Running Orders",
                        style: TextStyle(
                          fontSize: AppSizes.sp18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.all(AppSizes.r10),
                        itemCount: state.orders.length,

                        itemBuilder: (context, index) {
                          final data = state.orders[index];
                          return Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: AppSizes.w5,
                              vertical: AppSizes.h10,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF98A8B8),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: CustomeCachedNetworkImage(
                                    urlImage: data.urlImage,
                                    width: AppSizes.w102,
                                    hight: AppSizes.w102,
                                  ),
                                ),
                                SizedBox(width: AppSizes.w8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "#${data.type}",
                                            style: TextStyle(
                                              color: LightColors.orangeColor,
                                            ),
                                          ),
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

                                          Text(
                                            "ID:${data.id}",
                                            style: TextStyle(
                                              color: Color(0xFF9C9BA6),
                                              fontSize: AppSizes.sp14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: AppSizes.h10),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "\$${data.price}",
                                            style: TextStyle(
                                              color: LightColors.primaryBlack,
                                              fontSize: AppSizes.sp18,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(width: AppSizes.w20),
                                          ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  LightColors.orangeColor,
                                              foregroundColor:
                                                  LightColors.primaryColor,
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                      AppSizes.r10,
                                                    ),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                horizontal: AppSizes.pw16,
                                                vertical: AppSizes.ph8,
                                              ),
                                            ),
                                            child: Text(
                                              'Done',
                                              style: TextStyle(
                                                fontSize: AppSizes.sp14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: AppSizes.w10),
                                          OutlinedButton(
                                            onPressed: () {},
                                            style: OutlinedButton.styleFrom(
                                              foregroundColor:
                                                  LightColors.orangeColor,

                                              side: BorderSide(
                                                color: LightColors.orangeColor,
                                                width: 1.5,
                                              ),

                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                      AppSizes.r8,
                                                    ),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                horizontal: AppSizes.pw10,
                                                vertical: AppSizes.ph6,
                                              ),
                                            ),
                                            child: Text(
                                              'Cancel',
                                              style: TextStyle(
                                                fontSize: AppSizes.sp16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: AppSizes.h10),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
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
