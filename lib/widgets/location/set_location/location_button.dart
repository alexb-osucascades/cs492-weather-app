import 'package:flutter/material.dart';

class LocationButton extends StatelessWidget {
  const LocationButton({
    super.key,
    required this.description,
    required this.callbackFunction,
    required this.icon,
  });

  final String description;
  final void Function() callbackFunction;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: callbackFunction, 
      icon: Icon(icon, size: 18),
      label: Text(description),
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        )
      ),
    );
  }
}