import 'package:flutter/material.dart';

class LoadingOverlayWidget extends StatelessWidget {
  final bool isVisible;
  final Color? overlayColor;

  const LoadingOverlayWidget({
    super.key,
    required this.isVisible,
    this.overlayColor,
  });

  @override
  Widget build(BuildContext context) {
    if (!isVisible) {
      return const SizedBox.shrink();
    }
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          color: overlayColor ?? Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
