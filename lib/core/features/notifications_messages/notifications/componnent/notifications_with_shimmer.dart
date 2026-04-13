import 'package:flutter/material.dart';
import 'package:wasel_app/core/shared/custome_shimmer_widget.dart';

class NotificationsWithShimmer extends StatelessWidget {
  const NotificationsWithShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomeShimmerWidget(hight: 54, width: 54, redus: 50),
                  const SizedBox(width: 18),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomeShimmerWidget(
                          hight: 16,
                          width: 100,
                          redus: 4,
                        ),
                        const SizedBox(height: 8),
                        const CustomeShimmerWidget(
                          hight: 14,
                          width: double.infinity,
                          redus: 4,
                        ),
                        const SizedBox(height: 4),
                        const CustomeShimmerWidget(
                          hight: 14,
                          width: 60,
                          redus: 4,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),

                  const CustomeShimmerWidget(hight: 54, width: 54, redus: 14),
                ],
              ),
              const SizedBox(height: 16),
              const Divider(color: Color(0xFFF0F4F9)),
            ],
          ),
        );
      },
    );
  }
}
