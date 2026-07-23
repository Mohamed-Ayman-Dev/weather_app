import 'package:flutter/material.dart';

class WeatherError extends StatelessWidget {
  const WeatherError({super.key, required this.message});

  final String message;

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
            // const Text('⛈️', style: TextStyle(fontSize: 60)),
            const SizedBox(height: 18),
            const Text(
              "Couldn't find that city",
              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xffFFB3BE),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white70, fontSize: 14),
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
              onPressed: () {},
              child: const Text('Try Again', style: TextStyle(fontSize: 14)),
            ),
          ],
        ),
      ),
    );
  }
}
