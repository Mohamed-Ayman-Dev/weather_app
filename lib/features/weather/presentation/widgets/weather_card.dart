import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/core/themes/colors.dart';
import 'package:weather_app/core/themes/gradients.dart';
import 'package:weather_app/core/themes/shadows.dart';
import 'package:weather_app/core/themes/text_styles.dart';

import '../../data/models/weather_model.dart';
import 'weather_condition_icon.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key, required this.weather});

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            gradient: AppGradients.primaryGradient,
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: AppColors.weatherCardBorderColor),
            boxShadow: [AppShadows.weatherCardShadow],
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 400),
                          child: Text(
                            '${weather.temperatureC?.round() ?? '--'}°',
                            key: ValueKey(weather.temperatureC),
                            style: AppTextStyles.headlineLarge,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          weather.cityName ?? '',
                          style: AppTextStyles.headlineSmall.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          weather.country ?? '',
                          style: AppTextStyles.bodyLarge.copyWith(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  WeatherConditionIcon(iconUrl: weather.conditionIconUrl),
                ],
              ),

              const SizedBox(height: 28),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.08),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Text(
                  weather.conditionText ?? '',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.titleMedium.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              if (weather.isFromCache) ...[
                // Indicate that the displayed data comes from the local cache.
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.cloud_off,
                      size: 18,
                      color: Colors.white70,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Showing cached result',
                      style: AppTextStyles.bodySmall.copyWith(
                        fontSize: 12,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
