import 'package:flutter/material.dart';
import 'package:flutter_riverpod_restapi/core/extensions/context_extension.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: context.width,
        height: 120, // Adjust this height as needed
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey[200]!, width: 2),
        ),
      ),
    );
  }
}
