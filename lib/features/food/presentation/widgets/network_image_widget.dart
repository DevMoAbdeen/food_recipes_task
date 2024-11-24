import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;

  const NetworkImageWidget({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black.withOpacity(0.05),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Hero(
          tag: imageUrl,
          child: CachedNetworkImage(
            height: height,
            width: width,
            cacheKey: imageUrl,
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, downloadProgress) => Center(
              child: CircularProgressIndicator(value: downloadProgress.progress),
            ),
            errorWidget: (context, url, error) =>  Center(
              child: Container(),
            ),
          ),
        ),
      ),
    );
  }
}
