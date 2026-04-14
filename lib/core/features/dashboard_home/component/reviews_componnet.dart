import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel_app/core/app_sizes/app_sizes.dart';
import 'package:wasel_app/core/di/injection_container.dart';
import 'package:wasel_app/core/features/reviews/cubit/review_cubit.dart';
import 'package:wasel_app/core/features/reviews/user_review_screen.dart';
import 'package:wasel_app/core/theme/light_colors/light_colors.dart';

class ReviewsComponnet extends StatelessWidget {
   ReviewsComponnet({super.key});
final reviewCubit = sl<ReviewCubit>()..fetchReviews();
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ReviewCubit, ReviewState>(
                        bloc: reviewCubit,
                        builder: (context, state) {
                          return Container(
                            padding: EdgeInsets.all(AppSizes.r10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: LightColors.primaryColor,
                              borderRadius: BorderRadius.circular(AppSizes.r16),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Reviews",
                                      style: TextStyle(
                                        fontSize: AppSizes.sp14,
                                        fontWeight: FontWeight.w400,
                                        color: LightColors.primaryBlack,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                UserReviewScreen(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'See All Reviews',
                                        style: TextStyle(
                                          fontSize: AppSizes.sp14,
                                          fontWeight: FontWeight.w400,
                                          decoration: TextDecoration.underline,
                                          decorationColor:
                                              LightColors.orangeColor,
                                          color: LightColors.orangeColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: AppSizes.h20),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: LightColors.orangeColor,
                                        ),
                                        SizedBox(width: AppSizes.w8),
                                        Text(
                                          "4.9",
                                          style: TextStyle(
                                            color: LightColors.orangeColor,
                                            fontSize: AppSizes.sp22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: AppSizes.w20),
                                    Text(
                                      "Total ${state.reviews.length} Reviews",
                                      style: TextStyle(
                                        fontSize: AppSizes.sp14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
  }
}