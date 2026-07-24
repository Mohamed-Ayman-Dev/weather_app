import 'package:flutter/material.dart';
import 'package:weather_app/core/themes/text_styles.dart';

import '../../../../core/error/validation.dart';

class WeatherSearchField extends StatelessWidget {
  const WeatherSearchField({
    super.key,
    required this.controller,
    required this.onSearch,
    required this.isLoading,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final ValueChanged<String> onSearch;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        controller: controller,
        enabled: !isLoading,
        textInputAction: TextInputAction.search,
        style: AppTextStyles.bodyMedium,
        onFieldSubmitted: (value) {
          if (formKey.currentState!.validate()) {
            onSearch(controller.text);
          }
        },
        validator: (value) {
          return Validation.validateEmpty(
            value,
            emptyMessage: 'City name is required',
          );
        },
        decoration: InputDecoration(
          hintText: 'Search city...',

          suffixIcon: Padding(
            padding: const EdgeInsets.all(3),
            child: FilledButton(
              onPressed: isLoading
                  ? null
                  : () {
                      if (formKey.currentState!.validate()) {
                        onSearch(controller.text);
                      }
                    },
              child: isLoading
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(
                      Icons.arrow_outward_rounded,
                      color: Colors.white,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
