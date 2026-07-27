import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wasel_app/core/shared/custome_shimmer_widget.dart';

class CustomeCachedNetworkImage extends StatelessWidget {
  final String urlImage;
  final double? width;
  final double? hight;
  final double? radius; 

  const CustomeCachedNetworkImage({
    super.key,
    required this.urlImage,
    this.hight,
    this.width,
    this.radius,   
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width ?? 122,
      height: hight ?? 80,
      imageUrl: urlImage,
      fit: BoxFit.cover,
      
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 0),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      
      placeholder: (context, url) => const CustomeShimmerWidget(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}