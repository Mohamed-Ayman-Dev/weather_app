import 'package:flutter/material.dart';

class WeatherSearchField extends StatelessWidget {
  const WeatherSearchField({
    super.key,
    required this.controller,
    required this.onSearch,
    required this.isLoading,
  });

  final TextEditingController controller;
  final ValueChanged<String> onSearch;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: !isLoading,
      textInputAction: TextInputAction.search,
      style: const TextStyle(color: Colors.white, fontSize: 18),
      onFieldSubmitted: onSearch,
      decoration: InputDecoration(
        hintText: 'Search city...',
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(.55),
          fontSize: 16,
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(.08),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 20,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.white.withOpacity(.3)),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.white.withOpacity(.3)),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.white.withOpacity(.3)),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: const BorderSide(color: Color(0xff8DBBFF), width: 1.6),
        ),

        suffixIcon: Padding(
          padding: const EdgeInsets.all(3),
          child: FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFF1C1B33).withOpacity(0.5),
              foregroundColor: Colors.black,
              shape: const CircleBorder(),
              padding: EdgeInsets.zero,
              elevation: 0,
            ),
            onPressed: isLoading ? null : () => onSearch(controller.text),
            child: isLoading
                ? const SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.arrow_outward_rounded, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
