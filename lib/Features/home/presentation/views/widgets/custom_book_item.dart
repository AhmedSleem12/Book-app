import 'package:bookely_app/core/utils/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import "package:cached_network_image/cached_network_image.dart";

class CustomBookImage extends StatelessWidget {
  final double? radius;
  final String imageUrl;
  const CustomBookImage({
    Key? key,
    this.radius = 20,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 3.9 / 6,
        child: CachedNetworkImage(
          filterQuality: FilterQuality.none,
          errorWidget: (context, url, error) => const Icon(Icons.error),
          placeholder: (context, url) => const CustomLoadingIndicator(),
          imageUrl: imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
