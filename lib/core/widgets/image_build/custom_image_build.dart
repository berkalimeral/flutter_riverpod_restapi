import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../loading/loading_screen.dart';

class CustomImageBuild extends StatelessWidget {
  const CustomImageBuild({
    super.key,
    required this.image,
  });

  final String? image;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image ?? '',
      fit: BoxFit.cover,
      placeholder: (context, url) => const LoadingScreen(),
      errorWidget: (context, url, error) => const Icon(Icons.image_outlined),
    );
  }
}
