import 'package:flutter/material.dart';

import 'package:wasel_app/core/shared/custome_shimmer_widget.dart';
import 'package:wasel_app/core/app_sizes/app_sizes.dart';


class CustomMenuWithShimer extends StatelessWidget {
  const CustomMenuWithShimer({super.key});

  @override
  Widget build(BuildContext context) {
   
              return Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverList.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: AppSizes.mw5,
                            vertical: AppSizes.mh15,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF98A8B8),
                                  borderRadius: BorderRadius.circular(AppSizes.r16),
                                ),
                                child: CustomeShimmerWidget(
                                  width: AppSizes.w102,
                                  hight: AppSizes.w102,
                                  redus: 16,
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomeShimmerWidget(redus: 10 ,  hight: 20,),

                                        Spacer(),
                                      CustomeShimmerWidget(redus: 10 ,  hight: 20,width: 50,),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        
                                           CustomeShimmerWidget(redus: 10 ,  hight: 20,width: 140,),
                                       
                                        Spacer(),
                                        CustomeShimmerWidget(redus: 10 ,  hight: 20,width: 50,),
                                      ],
                                    ),
                                    SizedBox(height: 30),
                                    Row(
                                      children: [
                                     
                                        CustomeShimmerWidget(redus: 10,hight: 20,width: 50,),
                                        SizedBox(width: 4),
                                        CustomeShimmerWidget(redus: 10,hight: 20,width: 50,),
                                        Spacer(),
                                        CustomeShimmerWidget(redus: 10,hight: 20,width: 50,),
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
      
