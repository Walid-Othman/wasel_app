import 'package:flutter/material.dart';
import 'package:wasel_app/core/shared/custome_shimmer_widget.dart';
import 'package:wasel_app/core/theme/light_colors/light_colors.dart';

class MessageWithShimmer extends StatelessWidget {
  const MessageWithShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
    itemCount: 8,
    itemBuilder: (context, index) {
      return Column(
        children: [
          ListTile(
            leading: Stack(
              children: [
                // شيمر الصورة الشخصية
                const CustomeShimmerWidget(hight: 50, width: 50, redus: 50),
                // شيمر نقطة الأونلاين (اختياري لو حابب تظهرها كدائرة رمادية)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: LightColors.primaryColor, width: 2),
                    ),
                  ),
                ),
              ],
            ),
            // شيمر الاسم
            title: const CustomeShimmerWidget(hight: 12, width: 80, redus: 4),
            // شيمر آخر رسالة
            subtitle: const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: CustomeShimmerWidget(hight: 10, width: 140, redus: 4),
            ),
            // شيمر الوقت وعدد الرسائل
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomeShimmerWidget(hight: 10, width: 30, redus: 4),
                const SizedBox(height: 8),
                const CustomeShimmerWidget(hight: 18, width: 24, redus: 50),
              ],
            ),
          ),
          const SizedBox(height: 18),
          const Divider(color: Color(0xFFF0F4F9)),
        ],
      );
    },
  );
  }
}