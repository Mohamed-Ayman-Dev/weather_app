import 'package:flutter/material.dart';
import 'package:weather_app/core/themes/text_styles.dart';

class WeatherPlaceholder extends StatelessWidget {
  const WeatherPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.wb_cloudy_outlined,
            size: 80,
            color: Colors.white.withOpacity(.5),
          ),
          const SizedBox(height: 16),
          Text(
            'Search for a city',
            style: AppTextStyles.titleLarge.copyWith(color: Colors.white70),
          ),
          const SizedBox(height: 8),
          Text(
            'Enter a city name to view the current weather.',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyMedium.copyWith(color: Colors.white54),
          ),
        ],
      ),
    );
  }
}
