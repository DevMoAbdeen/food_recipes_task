import 'package:flutter/material.dart';
import '../../extensions/screen_size_extensions.dart';

class ContainerShimmer extends StatelessWidget {
  final double? height;
  final double? width;
  final double? borderRadius;

  const ContainerShimmer({
    super.key,
    this.height,
    this.width,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 15,
      width: width ?? context.screenWidth() / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 8)),
        color: Colors.white,
      ),
    );
  }
}
