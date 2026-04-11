import 'package:flutter/material.dart';

import 'package:wasel_app/core/shared/custome_shimmer_widget.dart';
import 'package:wasel_app/core/shared/widgets/cart_contanir.dart';

class CustomeListShimerReview extends StatelessWidget {
  const CustomeListShimerReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: CustomScrollView(
        slivers: [
          SliverList.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Color(0xFFF6F8FA),
                      child: CustomeShimmerWidget(
                        width: 50,
                        hight: 50,
                        redus: 50,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CartContanir(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: CustomeShimmerWidget(
                                    hight: 20,
                                    width: double.infinity,
                                    redus: 10,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            CustomeShimmerWidget(
                              hight: 20,
                              width: 150,
                              redus: 10,
                            ),
                            SizedBox(height: 10),
                            CustomeShimmerWidget(hight: 20, redus: 10),
                            Row(children: [
                                                
                                                 
                                                ],),
                            SizedBox(height: 10),
                            CustomeShimmerWidget(
                              hight: 20,
                              width: double.infinity,
                              redus: 10,
                            ),
                            SizedBox(height: 10),
                            CustomeShimmerWidget(
                              hight: 20,
                              width: double.infinity,
                              redus: 10,
                            ),
                            SizedBox(height: 10),
                            CustomeShimmerWidget(
                              hight: 20,
                              width: double.infinity,
                              redus: 10,
                            ),
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
