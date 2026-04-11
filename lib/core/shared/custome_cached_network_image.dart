import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wasel_app/core/shared/custome_shimmer_widget.dart';

class CustomeCachedNetworkImage extends StatelessWidget {
  CustomeCachedNetworkImage({
    super.key,
    required this.urlImage,
    this.hight,
    this.width,
  });
  String urlImage;
  final double? width;
  final double? hight;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width ?? 122,
      height: hight ?? 80,
      imageUrl: urlImage,
      placeholder: (context, url) => CustomeShimmerWidget(),
      errorWidget: (context, url, error) => Icon(Icons.error),
      fit: BoxFit.cover,
    );
  }
}
