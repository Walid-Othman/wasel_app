import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                            padding: EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: LightColors.primaryColor,
                              borderRadius: BorderRadius.circular(16),
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
                                        fontSize: 14,
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
                                          fontSize: 14,
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
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: LightColors.orangeColor,
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          "4.9",
                                          style: TextStyle(
                                            color: LightColors.orangeColor,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 20),
                                    Text(
                                      "Total ${state.reviews.length} Reviews",
                                      style: TextStyle(
                                        fontSize: 14,
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