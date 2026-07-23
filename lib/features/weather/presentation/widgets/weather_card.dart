import 'package:flutter/material.dart';

import '../../data/models/weather_model.dart';
import 'weather_condition_icon.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key, required this.weather});

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (weather.isFromCache)
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Chip(
                  avatar: const Icon(Icons.cloud_off, size: 18),
                  label: const Text('Showing cached result'),
                ),
              ),

            Text(
              weather.cityName ?? '-',
              style: theme.textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),

            if ((weather.country ?? '').isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(
                weather.country!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],

            const SizedBox(height: 24),

            WeatherConditionIcon(iconUrl: weather.conditionIconUrl),

            const SizedBox(height: 16),

            Text(
              weather.temperatureC != null
                  ? '${weather.temperatureC!.toStringAsFixed(1)}°C'
                  : '--',
              style: theme.textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              weather.conditionText ?? '-',
              style: theme.textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
