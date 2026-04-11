import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomeShimmerWidget extends StatelessWidget {
  const CustomeShimmerWidget({
    super.key,
    this.hight,
    this.width,
    this.baseColor,
    this.highLightColor,
    this.redus
  });
  final double? width;
  final double? hight;
  final double? redus;

  final Color? baseColor;
  final Color? highLightColor;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey.shade300,
      highlightColor: highLightColor ?? Colors.grey.shade100,
      child: Container(
        width: width ?? 122,
        height: hight ?? 80,
        decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.circular(redus ?? 0)
        ),
      ),
    );
  }
}
