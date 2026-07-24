import 'package:flutter/material.dart';
import 'package:weather_app/core/themes/text_styles.dart';

class WeatherError extends StatelessWidget {
  const WeatherError({
    super.key,
    required this.message,
    required this.onTryAgain,
  });

  final String message;
  final void Function() onTryAgain;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: Colors.redAccent.withOpacity(.07),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: Colors.redAccent.withOpacity(.35)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 18),
            Text(
              "Couldn't find that city",
              textAlign: TextAlign.center,
              style: AppTextStyles.headlineSmall,
            ),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodySmall,
            ),
            const SizedBox(height: 28),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(.12),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                minimumSize: const Size(160, 52),
              ),
              onPressed: onTryAgain,
              child: Text('Try Again', style: AppTextStyles.labelSmall),
            ),
          ],
        ),
      ),
    );
  }
}
