import 'package:flutter/material.dart';

class LocationInput extends StatelessWidget {
  const LocationInput({
    super.key,
    required this.controller,
    required this.showError,
    this.onSubmitted,
  });

  final TextEditingController controller;
  final bool showError;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        labelText: "Enter City or Zip Code",
        hintText: "e.g., Bend, OR",
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        errorText: showError ? "Error: Must Type Location" : null,
      ),
    );
  }
}