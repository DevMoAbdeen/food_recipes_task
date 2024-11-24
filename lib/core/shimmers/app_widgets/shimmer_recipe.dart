import 'package:flutter/material.dart';
import '../../../core/extensions/screen_size_extensions.dart';
import '../../../core/extensions/sized_box_extension.dart';
import '../shimmer_widgets/container_shimmer.dart';
import '../shimmer_widgets/shimmer_color_widget.dart';

class ShimmerRecipe extends StatelessWidget {
  const ShimmerRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card.outlined(
        child: Row(
          children: [
            const ShimmerColorWidget(child: ContainerShimmer(height: 120, width: 120)),
            8.widthSpace(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  8.heightSpace(),
                  const ShimmerColorWidget(child: ContainerShimmer()),
                  8.heightSpace(),
                  ShimmerColorWidget(child: ContainerShimmer(width: context.screenWidth() / 3)),
                  8.heightSpace(),
                  ShimmerColorWidget(child: ContainerShimmer(height: 10, width: context.screenWidth() / 5)),
                  8.heightSpace(),
                  ShimmerColorWidget(child: ContainerShimmer(height: 20, width: context.screenWidth() / 3)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
