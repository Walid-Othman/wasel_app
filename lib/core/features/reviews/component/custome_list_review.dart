import 'package:flutter/material.dart';
import 'package:wasel_app/core/app_sizes/app_sizes.dart';
import 'package:wasel_app/core/shared/component/custome_bottom_sheet.dart';
import 'package:wasel_app/core/shared/component/custome_show_alert_dialog.dart';
import 'package:wasel_app/core/shared/custome_cached_network_image.dart';
import 'package:wasel_app/core/shared/widgets/cart_contanir.dart';
import 'package:wasel_app/core/theme/light_colors/light_colors.dart';

class CustomeListReview extends StatelessWidget {
  const CustomeListReview({super.key, required this.state});
  final state;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSizes.r16),
      child: CustomScrollView(
        slivers: [
          SliverList.builder(
            itemCount: state.reviews.length,
            itemBuilder: (context, index) {
              final data = state.reviews[index];
              return Container(
                margin: EdgeInsets.all(AppSizes.r10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: AppSizes.r25,
                      backgroundColor: Color(0xFFF6F8FA),
                      child: CustomeCachedNetworkImage(
                        urlImage: data.userImage,
                        width: AppSizes.w50,
                        hight: AppSizes.w50,
                      ),
                    ),
                    SizedBox(width: AppSizes.w10),
                    Expanded(
                      child: CartContanir(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(data.date),
                                GestureDetector(
                                  child: Icon(Icons.more_vert),
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,

                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(AppSizes.r20),
                                        ),
                                      ),
                                      builder: (context) {
                                        return CustomeBottomSheet.justDelete(
                                          listTitletwo: "Delete Reviews",
                                          onDelete: () async {
                                           await showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  CustomeShowAlertDialog(
                                                    title: "Delete Review",
                                                    content:
                                                        "Are you sure you want to delete this review?",
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                            
                                            );
                                            Navigator.pop(context);
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              data.userName,
                              style: TextStyle(
                                fontSize: AppSizes.sp14,
                                color: Color(0xFF32343E),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: AppSizes.h10),
                            Row(
                              children: List.generate(5, (index) {
                                return Icon(
                                  index < data.rating
                                      ? Icons.star
                                      : Icons.star_outline,
                                  color: LightColors.orangeColor,
                                  size: 20,
                                );
                              }),
                            ),
                            SizedBox(height: AppSizes.h10),
                            Text(data.comment),
                          ],
                        ),
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
