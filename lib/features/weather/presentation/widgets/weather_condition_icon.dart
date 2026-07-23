import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WeatherConditionIcon extends StatelessWidget {
  const WeatherConditionIcon({super.key, required this.iconUrl});

  final String? iconUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: iconUrl ?? '',
      width: 72,
      height: 72,
      fit: BoxFit.contain,
      placeholder: (_, __) => const SizedBox(
        width: 72,
        height: 72,
        child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
      ),
      errorWidget: (_, __, ___) => const Icon(Icons.cloud_outlined, size: 72),
    );
  }
}
