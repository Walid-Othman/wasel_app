import 'package:flutter/material.dart';
import 'package:wasel_app/core/app_sizes/app_sizes.dart';
import 'package:wasel_app/core/features/reviews/edit_review_screen.dart';
import 'package:wasel_app/core/shared/custome_cached_network_image.dart';
import 'package:wasel_app/core/shared/widgets/cart_contanir.dart';
import 'package:wasel_app/core/theme/light_colors/light_colors.dart';

class CustomeListReview extends StatelessWidget {
  const CustomeListReview({super.key, required this.state});
  final state;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(AppSizes.r16),
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

                                      shape:  RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(AppSizes.r20),
                                        ),
                                      ),
                                      builder: (context) {
                                        return Container(
                                          padding:  EdgeInsets.symmetric(
                                            vertical: AppSizes.ph20,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                width: AppSizes.w40,
                                                height: AppSizes.h5,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[300],
                                                  borderRadius:
                                                      BorderRadius.circular(AppSizes.r10),
                                                ),
                                              ),
                                               SizedBox(height: AppSizes.h20),

                                              ListTile(
                                                leading: const Icon(
                                                  Icons.edit,
                                                  color: Colors.blue,
                                                ),
                                                title: const Text(
                                                  'Edit Review',
                                                ),
                                                onTap: () async {
                                                  Navigator.pop(context);
                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          EditReviewScreen(
                                                            data: data,
                                                          ),
                                                    ),
                                                  );
                                                },
                                              ),

                                              ListTile(
                                                leading: const Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                ),
                                                title: const Text(
                                                  'Delete Review',
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        AlertDialog(
                                                          title: Text(
                                                            "Delete Review",
                                                          ),
                                                          content: Text(
                                                            "Are you sure you want to delete review",
                                                          ),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                  context,
                                                                );
                                                              },
                                                              child: Text(
                                                                "Cancel",
                                                              ),
                                                            ),
                                                            TextButton(
                                                              onPressed: () {},
                                                              child: Text(
                                                                "Delete",
                                                                style: TextStyle(
                                                                  color: Colors
                                                                      .red,
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
