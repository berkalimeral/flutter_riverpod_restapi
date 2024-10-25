import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../loading/loading_screen.dart';

class CustomImageBuild extends StatelessWidget {
  const CustomImageBuild({
    super.key,
    required this.image,
    this.width,
  });

  final String? image;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image ?? '',
      fit: BoxFit.cover,
      width: width,
      placeholder: (context, url) => const LoadingScreen(),
      errorWidget: (context, url, error) => const Icon(Icons.image_outlined),
    );
  }
}
