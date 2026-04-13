import 'package:flutter/material.dart';
import 'package:wasel_app/core/shared/custome_shimmer_widget.dart';

class CustomOrderCardWithShimmer extends StatelessWidget {
  const CustomOrderCardWithShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
     
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
      
          const Padding(
            padding: EdgeInsets.only(left: 20, bottom: 4),
            child: CustomeShimmerWidget(hight: 22, width: 180, redus: 4),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: 4, 
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 15,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     
                      const CustomeShimmerWidget(
                        hight: 102,
                        width: 102,
                        redus: 16,
                      ),

                      const SizedBox(width: 8),

                      
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          
                            const CustomeShimmerWidget(
                              hight: 14,
                              width: 50,
                              redus: 4,
                            ),
                            const SizedBox(height: 8),

                          
                            const CustomeShimmerWidget(
                              hight: 18,
                              width: double.infinity,
                              redus: 4,
                            ),
                            const SizedBox(height: 8),

                         
                            const CustomeShimmerWidget(
                              hight: 14,
                              width: 90,
                              redus: 4,
                            ),

                            const SizedBox(height: 12),

                          
                            Row(
                              children: [
                              
                                const CustomeShimmerWidget(
                                  hight: 24,
                                  width: 40,
                                  redus: 4,
                                ),

                                const SizedBox(width: 20),

                             
                                const SizedBox(width: 10),

                                
                                const CustomeShimmerWidget(
                                  hight: 32,
                                  width: 75,
                                  redus: 8,
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
          ),
        ],
      ),
    );
  }
}
