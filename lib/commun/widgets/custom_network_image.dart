import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.backgroundImageURL,
    this.shimmerBorderRadius,
    this.shape = BoxShape.rectangle,
    this.isJustTopRadius = false,
    this.fit = BoxFit.fitWidth
  });

  final String backgroundImageURL;
  final double? shimmerBorderRadius;
  final BoxShape shape;
  final bool isJustTopRadius;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: isJustTopRadius 
        ? BorderRadius.only(
          topLeft: Radius.circular(shimmerBorderRadius ?? 0),
          topRight: Radius.circular(shimmerBorderRadius ?? 0),
        )
        : BorderRadius.circular(shimmerBorderRadius ?? 0),
      child: Image.network(
        backgroundImageURL,
        fit: fit,
        alignment: Alignment.topCenter,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return LoaderWithShimmer(
              shimmerBorderRadius: shimmerBorderRadius,
              shape: shape,
              isJustTopRadius: isJustTopRadius,
            );
          }
        },
        errorBuilder: (context, error, stackTrace) => LoaderWithShimmer(
          shimmerBorderRadius: shimmerBorderRadius,
          shape: shape,
          isJustTopRadius: isJustTopRadius,
        ),
      ),
    );
  }
}

class LoaderWithShimmer extends StatelessWidget {
  const LoaderWithShimmer({
    super.key,
    this.shimmerBorderRadius,
    this.shape = BoxShape.rectangle,
    this.isJustTopRadius = false,
  });

  final double? shimmerBorderRadius;
  final BoxShape shape;
  final bool isJustTopRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: shape,
        color: Colors.grey,
      ),
    ) .animate(
      onComplete: (controller) => controller.repeat()
    ).shimmer(
      duration: const Duration(seconds: 1)
    );
  }
}