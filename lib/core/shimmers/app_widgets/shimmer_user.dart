import 'package:flutter/material.dart';
import '../../extensions/screen_size_extensions.dart';
import '../../extensions/sized_box_extension.dart';
import '../shimmer_widgets/container_shimmer.dart';
import '../shimmer_widgets/shimmer_color_widget.dart';

class ShimmerUser extends StatelessWidget {
  const ShimmerUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card.outlined(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  const ShimmerColorWidget(child: CircleAvatar(radius: 30)),
                  8.widthSpace(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        8.heightSpace(),
                        const ShimmerColorWidget(child: ContainerShimmer(height: 20)),
                        8.heightSpace(),
                        ShimmerColorWidget(child: ContainerShimmer(width: context.screenWidth() / 1.5)),
                        8.heightSpace(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const ShimmerColorWidget(child: ContainerShimmer(height: 15, width: 15)),
                            8.widthSpace(),
                            const ShimmerColorWidget(child: ContainerShimmer(height: 10, width: 80)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(),
              // 8.heightSpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ShimmerColorWidget(child: ContainerShimmer(width: 90)),
                  8.widthSpace(),
                  const ShimmerColorWidget(child: ContainerShimmer(width: 90)),
                ],
              ),
              16.heightSpace(),
              Align(
                alignment: Alignment.bottomCenter,
                child: ShimmerColorWidget(child: ContainerShimmer(height: 40, width: context.screenWidth() / 2)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
