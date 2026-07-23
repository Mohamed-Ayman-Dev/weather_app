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
    return Column(
      children: [
        TextField(
          controller: controller,
          textInputAction: TextInputAction.search,
          enabled: !isLoading,
          decoration: const InputDecoration(
            hintText: 'Enter city name',
            prefixIcon: Icon(Icons.location_city),
            border: OutlineInputBorder(),
          ),
          onSubmitted: onSearch,
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: FilledButton.icon(
            onPressed: isLoading
                ? null
                : () => onSearch(controller.text),
            icon: const Icon(Icons.search),
            label: const Text('Search'),
          ),
        ),
      ],
    );
  }
}